goog.provide 'aa.ProjectModel'

goog.require 'goog.array'
goog.require 'goog.events.EventTarget'

class aa.ProjectModel extends goog.events.EventTarget
  ###*
    @constructor
    @extends {goog.events.EventTarget}
  ###
  constructor: ->
    super()

    @isLoading = no
    @filter = {}
    @rows = null

  isLoaded: ->
    @rows? and not @isLoading

  getSplashData: ->
    'colors':
      'bg': '#4c746c'
      'content': '#C6CFCE'
    'title': 'FIALA+NEMEC'
    'imageUrl': '/img/data/01.jpg'

  getSelectedData: ->
    @rows

  getAllData: ->
    @rows

  getDetail: (projectSlug) ->
    list = aa.mock.List.data
    data = aa.mock.Detail[projectSlug]

    return unless data

    actualIndex = goog.array.findIndex list, (item) -> item.slug is projectSlug

    data['previousProject'] = if actualIndex is 0 then list[list.length - 1] else list[actualIndex - 1]
    data['nextProject'] = if actualIndex is list.length - 1 then list[0] else list[actualIndex + 1]

    data

  getParams: ->
    aa.mock.Params

  load: ->
    setTimeout(=>
      @rows = aa.mock.List.data
      console.log 'load internal', @
      @dispatchEvent 'change'
    , 1000)

