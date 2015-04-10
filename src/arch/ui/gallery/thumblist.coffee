goog.provide 'arch.ui.gallery.ThumbList'

goog.require 'react'
goog.require 'arch.ui.gallery.ThumbItem'


arch.ui.gallery.ThumbList = React.createClass
  getDefaultProps: ->
    'items': []
    'actualItemIndex': 0
    'onPageChange': ->
    'labels':
      'prev': '<'
      'next': '>'

  render: ->
    items = []

    items.push React.createElement arch.ui.gallery.ThumbItem,
      'key': @props['labels']['prev']
      'title': @props['labels']['prev']
      'classes': ['thumblist-navig-prev']
      'display': @props['actualItemIndex'] isnt 0
      'onClick': @selectPage.bind @, Math.max 0, @props['actualItemIndex'] - 1

    for page, index in @props['items']
      items.push React.createElement arch.ui.gallery.ThumbItem,
        'key': index + page['title']
        'title': page['title']
        'classes': ['thumblist-navig-item']
        'thumbUrl': page['thumbUrl']
        'active': @props['actualItemIndex'] is index
        'onClick': @selectPage.bind @, index

    items.push React.createElement arch.ui.gallery.ThumbItem,
      'key': @props['labels']['next']
      'title': @props['labels']['next']
      'classes': ['thumblist-navig-next']
      'display': @props['actualItemIndex'] isnt @props['items'].length - 1
      'onClick': @selectPage.bind @, Math.min @props['items'].length - 1, @props['actualItemIndex'] + 1

    React.DOM.ul 'className': 'thumb-list', items

  selectPage: (pageIndex) ->
    @props['onPageChange'] pageIndex
    return
