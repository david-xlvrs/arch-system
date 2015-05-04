goog.provide 'sandbox.Bootstrap'

goog.require 'aa.template'
goog.require 'aa.mock'
goog.require 'aa.ui.Application'
goog.require 'aa.ProjectModel'
goog.require 'goog.dom'
goog.require 'goog.History'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

  templateEl = goog.dom.htmlToDocumentFragment aa.template.main().toString()
  goog.dom.appendChild document.body, templateEl
  appEl = goog.dom.getElementByClass 'content', (`/** @type {!Element} */`) templateEl

  projectsModel = new aa.ProjectModel()

  actSection = aa.ui.Application.SECTION_SPLASH

  getCompleteSettings = ->
    'section': actSection
    'loaded': projectsModel.isLoaded()
    'data':
      'splash': projectsModel.getSplashData()
      'selected': projectsModel.getSelectedData()

  render = ->
    aa.ui.application.render getCompleteSettings(), appEl

  #render()

  projectsModel.load()

  projectsModel.addEventListener 'change', (e) ->
    console.log 'pali change'
    render()

  h = new goog.History()
  goog.events.listen h, goog.history.EventType.NAVIGATE, (e) ->
    console.log 'NAVIGATE', e
    actSection = switch e.token
      when 'selected' then aa.ui.Application.SECTION_SELECTED
      else aa.ui.Application.SECTION_SPLASH
    render()

  h.setEnabled yes

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
