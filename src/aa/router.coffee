goog.provide 'aa.Router'

goog.require 'goog.events.EventTarget'
goog.require 'goog.events'
goog.require 'goog.History'
goog.require 'goog.string'


class aa.Router extends goog.events.EventTarget
  ###*
    @param {Object} config
    @constructor
    @extends {goog.events.EventTarget}
  ###
  constructor: (@config) ->
    super()

    ###* @private ###
    @previousRoute = ''

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
            # TODO: vyresit lepe odstraneni zavorek
            params[parsedRoute[i].replace('{', '').replace('}', '')] = part
          else
            continue
        if hash.length is i + 1
          foundRoute = route
          break

    if foundRoute or goog.string.isEmpty foundRoute
      @status =
        'section': @config[foundRoute]
        'route': foundRoute
        'params': params
        'transition': @getTransition @previousRoute, foundRoute

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
      when not previousRoute or not newRoute then aa.ui.Application.TRANSITION_SPLASH_2_SECTION
      when newRoute is 'selected/{projectId}' then aa.ui.Application.TRANSITION_SELECTED_2_DETAIL
      when previousRoute is 'selected/{projectId}'
        if newRoute is 'selected'
          aa.ui.Application.TRANSITION_DETAIL_2_SELECTED
        else
          aa.ui.Application.TRANSITION_DETAIL_2_SECTION
      else aa.ui.Application.TRANSITION_SECTION_2_SECTION

  ###*
    @private
  ###
  parseToken: (token) ->
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
