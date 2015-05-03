goog.provide 'sandbox.Bootstrap'

goog.require 'goog.dom'
goog.require 'aa.template'
goog.require 'aa.mock'
goog.require 'aa.ui.Application'
goog.require 'aa.ProjectModel'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

  templateEl = goog.dom.htmlToDocumentFragment aa.template.main().toString()
  goog.dom.appendChild document.body, templateEl
  appEl = goog.dom.getElementByClass 'content', (`/** @type {!Element} */`) templateEl

  projectsModel = new aa.ProjectModel()

  getCompleteSettings = ->
    'section': aa.ui.Application.SECTION_SPLASH
    'loaded': projectsModel.isLoaded()
    'data':
      'splash': projectsModel.getSplashData()

  render = ->
    aa.ui.application.render getCompleteSettings(), appEl

  render()

  projectsModel.load()

  projectsModel.addEventListener 'change', (e) ->
    console.log 'pali change'
    render()

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
