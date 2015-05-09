goog.provide 'aa.ProjectModel'

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
    'title': 'D3A'
    'imageUrl': '/img/data/01.jpg'

  getSelectedData: ->
    @rows

  getAllData: ->
    @rows

  getDetail: (projectId) ->
    aa.mock.Detail.data

  load: ->
    setTimeout(=>
      @rows = aa.mock.List.data
      console.log 'load internal', @
      @dispatchEvent 'change'
    , 1000)

