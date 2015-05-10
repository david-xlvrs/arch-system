goog.provide 'sandbox.Bootstrap'

goog.require 'aa.template'
goog.require 'aa.mock'
goog.require 'aa.ui.Application'
goog.require 'aa.ProjectModel'
goog.require 'goog.dom'
goog.require 'goog.History'
goog.require 'aa.Router'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

  ###*
    DOM things
  ###
  templateEl = goog.dom.htmlToDocumentFragment aa.template.main().toString()
  goog.dom.appendChild document.body, templateEl
  appEl = goog.dom.getElementByClass 'content', (`/** @type {!Element} */`) templateEl

  ###*
    ProjectsModel
  ###
  projectsModel = new aa.ProjectModel()
  projectsModel.load()
  projectsModel.addEventListener 'change', (e) ->
    completeSettings['loaded'] = projectsModel.isLoaded()
    completeSettings['data'] =
      'splash': projectsModel.getSplashData()
      'selected': projectsModel.getSelectedData()
      'all': projectsModel.getAllData()
      'detail': projectsModel.getDetail 1
    render()

  ###*
    Settings for Application
  ###
  completeSettings =
    'section': aa.ui.Application.SECTION_SPLASH
    'transition': aa.ui.Application.TRANSITION_SPLASH_2_SECTION
    'loaded': projectsModel.isLoaded()
    'data':
      'splash': projectsModel.getSplashData()
      'selected': projectsModel.getSelectedData()
      'all': projectsModel.getAllData()
      'detail': projectsModel.getDetail 1
      'detailSlide': 0

  ###*
    Render whole application
  ###
  render = ->
    aa.ui.application.render completeSettings, appEl

  ###*
    Router settings and listening
  ###
  router = new aa.Router
    '': aa.ui.Application.SECTION_SPLASH
    'selected': aa.ui.Application.SECTION_SELECTED
    'selected/{projectId}': aa.ui.Application.SECTION_DETAIL
    'selected/{projectId}/{slideId}': aa.ui.Application.SECTION_DETAIL
    'selected/{projectId}/{slideId}/full': aa.ui.Application.SECTION_DETAIL
    'index': aa.ui.Application.SECTION_INDEX

  goog.events.listen router, aa.Router.EventType.CHANGE, (e) ->
    routerStatus = router.getStatus()
    completeSettings['section'] = routerStatus['section']
    completeSettings['transition'] = routerStatus['transition']

    if routerStatus['params']?['projectId']
      completeSettings['data']['detail'] = projectsModel.getDetail routerStatus['params']?['projectId']
      completeSettings['data']['detailSlide'] = routerStatus['params']?['slideId']

    render()

  router.enableRouting()

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
