goog.provide 'sandbox.Bootstrap'

goog.require 'aa.template'
goog.require 'aa.Const'
goog.require 'aa.mock'
goog.require 'aa.ui.Application'
goog.require 'aa.ProjectModel'
goog.require 'goog.dom'
goog.require 'goog.fx.dom'
goog.require 'goog.History'
goog.require 'aa.Router'

top.location = self.location if self isnt top

sandbox.Bootstrap = ->

  ###*
    DOM things
  ###
  appEl = goog.dom.htmlToDocumentFragment aa.template.main().toString()
  goog.dom.appendChild document.body, appEl

  ###*
    ProjectsModel
  ###
  projectsModel = new aa.ProjectModel()
  projectsModel.load()
  projectsModel.addEventListener 'change', (e) ->
    completeSettings['filter']['params'] = projectsModel.getParams()
    completeSettings['loaded'] = projectsModel.isLoaded()
    completeSettings['data']['splash'] = projectsModel.getSplashData()
    completeSettings['data']['selected'] = projectsModel.getSelectedData()
    completeSettings['data']['all'] = projectsModel.getAllData()

    routerStatus = router.getStatus()
    completeSettings['data']['detail'] = projectsModel.getDetail routerStatus['params']?['projectSlug']
    render()

  ###*
    Event Handlers
  ###
  handleScrollTo = (scrollTo, element) ->
    element = document.body unless element
    animScroll = new goog.fx.dom.Scroll element, [0, goog.dom.getDocumentScroll().y], [0, scrollTo], aa.Const.ANIMATION.DURATION, (input) ->
      input * input * input
    animScroll.play()
    return

  wheeling = null
  wheelDelta = 0
  wheelDeltaPrev = 1
  handleWheel = (e) ->
    if completeSettings['section'] isnt aa.Const.SECTION.SELECTED and completeSettings['section'] isnt aa.Const.SECTION.INDEX
      wheelDeltaPrev = 0
      return

    clearTimeout wheeling

    wheeling = setTimeout (->
      wheeling = undefined
      wheelDeltaPrev = wheelDelta
    ), 150

    if wheelDelta - wheelDeltaPrev + aa.ui.Application.SPLASH_DELTA_LIMIT > 0 and wheelDeltaPrev isnt 0
      window.location.href = aa.Router.getRoute aa.Const.SECTION.SPLASH

    if goog.dom.getDocumentScroll().y > 0
      wheelDelta = 0
      return
    delta = Math.max( -1, Math.min(1, (e.wheelDelta or -e.detail)))
    wheelDelta += delta

  window.addEventListener 'mousewheel', handleWheel
  window.addEventListener 'DOMMouseScroll', handleWheel

  ###*
    Settings for Application
  ###
  completeSettings =
    'section': aa.Const.SECTION.SPLASH
    'transition': aa.ui.Application.TRANSITION_SPLASH_2_SECTION
    'loaded': projectsModel.isLoaded()
    'handleScrollTo': handleScrollTo
    'styleConfig':
      'colors':
        'content': '#222'
        'bg': '#fff'
    'viewport':
      'width': goog.dom.getViewportSize().width
      'height': goog.dom.getViewportSize().height
    'data':
      'splash': projectsModel.getSplashData()
      'selected': projectsModel.getSelectedData()
      'all': projectsModel.getAllData()
      'detail': projectsModel.getDetail 1
      'detailSlide': 0
    'filter':
      'search': ''
      'params': []
      'sortBy': 'date'
      'sortWay': 'desc'

  ###*
    Render whole application
  ###
  render = ->
    aa.ui.application.render completeSettings, appEl

  ###*
    Router settings and listening
  ###
  prevDetailSlide = 0
  router = new aa.Router
    '': aa.Const.SECTION.SPLASH
    'selected': aa.Const.SECTION.SELECTED
    'selected/{projectSlug}': aa.Const.SECTION.DETAIL
    'selected/{projectSlug}/{slideId}': aa.Const.SECTION.DETAIL
    'selected/{projectSlug}/{slideId}/{full}': aa.Const.SECTION.DETAIL
    'index': aa.Const.SECTION.INDEX
    'index/{sortBy}/{sortWay}': aa.Const.SECTION.INDEX
    'index/{sortBy}/{sortWay}/{search}': aa.Const.SECTION.INDEX

  goog.events.listen router, aa.Router.EventType.CHANGE, (e) ->
    routerStatus = router.getStatus()
    completeSettings['section'] = routerStatus['section']
    completeSettings['transition'] = routerStatus['transition']

    if router.getStatus()['section'] in [aa.Const.SECTION.SELECTED, aa.Const.SECTION.INDEX, aa.Const.SECTION.PRIVATE]
      completeSettings['previousSection'] = router.getStatus()['section']

    if routerStatus['params']?['projectSlug']
      completeSettings['data']['detail'] = projectsModel.getDetail routerStatus['params']?['projectSlug']
      newDetailSlide = completeSettings['data']['detailSlide'] = parseInt routerStatus['params']?['slideId'], 10

      completeSettings['inFullscreen'] = !!routerStatus['params']['full']

      slidesCount = completeSettings['data']['detail']['slides'].length

      if (newDetailSlide > prevDetailSlide and not (prevDetailSlide is 0 and newDetailSlide + 1 is slidesCount)) or
          (newDetailSlide is 0 and prevDetailSlide + 1 is slidesCount)
        window.detailDirection = 1
      else
        window.detailDirection = 0

      prevDetailSlide = newDetailSlide

    if routerStatus['params']?['sortBy']
      completeSettings['filter']['sortBy'] = routerStatus['params']?['sortBy']
      completeSettings['filter']['sortWay'] = routerStatus['params']?['sortWay']

    if routerStatus['params']?['search']
      completeSettings['filter']['search'] = routerStatus['params']['search']
    else
      completeSettings['filter']['search'] = ''

    render()

  router.enableRouting()

  ###*
    Listening RESIZE and SCROLL
  ###
  window.addEventListener 'resize', ->
    completeSettings['viewport'] =
      'width': goog.dom.getViewportSize().width
      'height': goog.dom.getViewportSize().height
    render()

  return

goog.exportSymbol 'sandbox.Bootstrap', sandbox.Bootstrap
