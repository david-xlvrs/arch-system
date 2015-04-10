goog.provide 'arch.ui.gallery.Gallery'

goog.require 'react'
goog.require 'arch.ui.gallery.ThumbList'


arch.ui.gallery.Gallery = React.createClass
  getDefaultProps: ->
    'items': []
    'initialItemIndex': 0
    'onPageChange': ->

  getInitialState: ->
    'actualItemIndex': @props['initialItemIndex']

  render: ->
    imageUrl = @props['items'][@state['actualItemIndex']]['imageUrl']

    img = React.DOM.img 'className': 'full-image', 'src': imageUrl

    React.DOM.div 'className': 'arch-gallery', [
      React.createElement(React.addons.CSSTransitionGroup, {transitionName: "example"},
        img
      ),
      #img, #TODO: zkusit transition React.addons.CSSTransitionGroup('example', img),
      React.createElement(arch.ui.gallery.ThumbList,
        'items': @props['items']
        'actualItemIndex': @state['actualItemIndex']
        'onPageChange': (pageIndex) =>
          @onPageChange pageIndex
        @props),
    ]

  onPageChange: (pageIndex) ->
    @setState 'actualItemIndex': pageIndex
    @props['onPageChange'] pageIndex
    return

###*
  @param {Object} gallerySettings #TODO: doplnit typedef
  @param {Element} parentEl
###
arch.ui.gallery.render = (gallerySettings, parentEl) ->
  gallery = React.createElement arch.ui.gallery.Gallery, gallerySettings
  React.render gallery, parentEl
  return
