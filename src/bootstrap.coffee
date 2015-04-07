goog.require 'goog.dom.DomHelper'
goog.require 'react'
goog.require 'sandbox.ReactComponent'
goog.require 'sandbox.template'

goog.provide 'sandbox.Bootstrap'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

	domHelper = new goog.dom.DomHelper
	templateEl = domHelper.htmlToDocumentFragment sandbox.template.main().toString()
	domHelper.appendChild document.body, templateEl

	rComponent = React.createElement sandbox.ReactComponent, 'title': 'React Component'
	React.render rComponent, domHelper.getElementByClass 'content', (`/** @type {!Element} */`) templateEl

	return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
