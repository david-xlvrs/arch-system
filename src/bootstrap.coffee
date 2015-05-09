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
  actTransition = aa.ui.Application.TRANSITION_SPLASH_2_SECTION
  previousToken = ''

  getCompleteSettings = ->
    'section': actSection
    'transition': actTransition
    'loaded': projectsModel.isLoaded()
    'data':
      'splash': projectsModel.getSplashData()
      'selected': projectsModel.getSelectedData()
      'all': projectsModel.getAllData()

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
    switch
      #from splash to section
      when not previousToken or not e.token then actTransition = aa.ui.Application.TRANSITION_SPLASH_2_SECTION
      when e.token is 'selected/1' then actTransition = aa.ui.Application.TRANSITION_SELECTED_2_DETAIL
      when previousToken is 'selected/1'
        if e.token is 'selected'
          actTransition = aa.ui.Application.TRANSITION_DETAIL_2_SELECTED
        else
          actTransition = aa.ui.Application.TRANSITION_DETAIL_2_SECTION

      else actTransition = aa.ui.Application.TRANSITION_SECTION_2_SECTION

    actSection = switch e.token
      when 'selected' then aa.ui.Application.SECTION_SELECTED
      when 'selected/1' then aa.ui.Application.SECTION_DETAIL
      when 'index' then aa.ui.Application.SECTION_INDEX
      else aa.ui.Application.SECTION_SPLASH

    previousToken = e.token
    render()

  h.setEnabled yes

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
