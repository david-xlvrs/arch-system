goog.provide 'arch.ui.gallery.ThumbItem'

arch.ui.gallery.ThumbItem = React.createClass
  statics:
    TYPE_NORMAL: 'type-normal'
    TYPE_PREVIOUS: 'type-previous'
    TYPE_NEXT: 'type-next'

  getDefaultProps: ->
    'title': ''
    'thumbUrl': ''
    'type': null
    'active': no
    'display': yes
    'onClick': ->

  render: ->
    classes = classNames {
      'thumblist-navig-item': !@props['type']
      'thumblist-navig-prev': @props['type'] is arch.ui.gallery.ThumbItem.TYPE_PREVIOUS
      'thumblist-navig-next': @props['type'] is arch.ui.gallery.ThumbItem.TYPE_NEXT
      'active': @props['active']
      'arch-hide': !@props['display']
    }

    content = [
      React.DOM.strong null, @props['title']
    ]
    content.push React.DOM.img 'src': @props['thumbUrl'] if @props['thumbUrl']

    React.DOM.li
      'className': classes
      'onClick': @props['onClick']
    , content
