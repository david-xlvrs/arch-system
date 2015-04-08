goog.provide 'sandbox.Bootstrap'

goog.require 'goog.dom'
goog.require 'react'
goog.require 'sandbox.template'
goog.require 'arch.mock'
goog.require 'arch.ui.gallery.Gallery'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

  templateEl = goog.dom.htmlToDocumentFragment sandbox.template.main().toString()
  goog.dom.appendChild document.body, templateEl

  settings =
    'items': for item in arch.mock.Project.items
      'title': item.title
      'thumbUrl': item.thumbUrl
      'imageUrl': item.imgUrl
    'initialItemIndex': 0
    'onPageChange': -> console.log 'outer change'

  galleryEl = domHelper.getElementByClass 'content', (`/** @type {!Element} */`) templateEl

  arch.ui.gallery.create settings, galleryEl

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
