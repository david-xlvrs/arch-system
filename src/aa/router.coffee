goog.provide 'aa.Router'

goog.require 'goog.events.EventTarget'
goog.require 'goog.events'
goog.require 'goog.History'
goog.require 'goog.string'
goog.require 'aa.Const'


class aa.Router extends goog.events.EventTarget
  ###*
    @param {Object} config
    @constructor
    @extends {goog.events.EventTarget}
  ###
  constructor: (@config) ->
    super()

    ###* @private ###
    @previousRoute = null

    ###* @private ###
    @previousSlideId = 0

    ###*
      @type {aa.Router.Status}
      @private
    ###
    @status = {}

    ###*
      @type {goog.History}
      @private
    ###
    @h = new goog.History()
    goog.events.listen @h, goog.history.EventType.NAVIGATE, @onNavigate

  ###*
    @param {boolean=} enabled
  ###
  enableRouting: (enabled = yes) ->
    @h.setEnabled enabled
    return

  ###*
    @return {aa.Router.Status}
  ###
  getStatus: ->
    @status

  ###*
    @param {*} reactComponent
  ###
  getUrl: (reactComponent) ->
    # TODO: vracet URL na zaklade toho jak komponenta prijde

  ###*
    @private
  ###
  onNavigate: (e) =>
    hash = @parseToken e.token
    @evaluate hash
    return

  ###*
    @param {Array.<string>} hash
    @private
  ###
  evaluate: (hash) ->
    foundRoute = null
    params = {}

    for part, i in hash
      break if foundRoute
      for route of @config
        parsedRoute = @parseToken route
        if part isnt parsedRoute[i]
          if parsedRoute[i]?[0] is '{'
            params[parsedRoute[i].replace(/[{}]/g, '')] = part
          else
            continue
        if hash.length is i + 1
          foundRoute = route
          break

    if foundRoute or goog.string.isEmpty foundRoute
      window.previousTransition = window.newTransition
      window.newTransition = @getTransition @previousRoute, foundRoute

      @status =
        'section': @config[foundRoute]
        'route': foundRoute
        'params': params
        'transition': window.newTransition

      @previousRoute = foundRoute
      @dispatchEvent new goog.events.Event aa.Router.EventType.CHANGE, @
    else
      console.error 'No Route', hash.join('/')

    return

  ###*
    @param {string} previousRoute
    @param {string} newRoute
    @return {string}
    @private
  ###
  getTransition: (previousRoute, newRoute) ->
    switch
      when goog.string.isEmpty(previousRoute) or not newRoute then aa.Const.TRANSITION.SPLASH_2_SECTION
      when newRoute is previousRoute and newRoute is 'selected/{projectSlug}/{slideId}'
        aa.Const.TRANSITION.SECTION_2_SECTION
      when newRoute is 'selected/{projectSlug}/{slideId}'
        aa.Const.TRANSITION.SECTION_2_SECTION
      when previousRoute is 'selected/{projectSlug}/{slideId}'
        if newRoute is 'selected'
          aa.Const.TRANSITION.SECTION_2_SECTION
        else
          aa.Const.TRANSITION.DETAIL_2_SECTION
      else aa.Const.TRANSITION.SECTION_2_SECTION

  ###*
    @private
  ###
  parseToken: (token) ->
    if token.substr(token.length - 1, 1) is '/'
      token = token.substr(0, token.length - 1)

    token.split aa.Router.DELIMITER


###*
  @const
###
aa.Router.DELIMITER = '/'

###*
  @enum {string}
###
aa.Router.EventType =
  CHANGE: goog.events.getUniqueId 'change'

###*
  @typedef {{
      section: string,
      route: string,
      params: (Object<string,string>),
      transition: string
  }}
###
aa.Router.Status
