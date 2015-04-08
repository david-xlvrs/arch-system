goog.provide 'arch.ui.gallery.Gallery'

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

    React.DOM.div 'className': 'arch-gallery', [
      React.createElement(React.addons.CSSTransitionGroup, {className: 'switchImg', transitionName: "example"},
        React.DOM.img 'key': imageUrl, 'className': 'full-image', 'src': imageUrl
      ),
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
