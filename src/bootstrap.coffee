goog.require 'goog.dom'
goog.require 'sandbox.ReactComponent'
goog.require 'sandbox.template'

goog.provide 'sandbox.Bootstrap'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

  templateEl = goog.dom.htmlToDocumentFragment sandbox.template.main().toString()
  goog.dom.appendChild document.body, templateEl

  rComponent = React.createElement sandbox.ReactComponent, 'title': 'React Component'
  React.render rComponent, goog.dom.getElementByClass 'content', (`/** @type {!Element} */`) templateEl

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
