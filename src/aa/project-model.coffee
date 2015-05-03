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
      'bg': '#906090'
      'content': '#333'
    'title': 'Studio Raketoplan'
    'imageUrl': 'http://www.bustler.net/images/gallery/international_architecture_awards_2009_03.jpg'

  load: ->
    setTimeout(=>
      @rows = aa.mock.List.data
      console.log 'load internal', @
      @dispatchEvent 'change'
    , 1000)

