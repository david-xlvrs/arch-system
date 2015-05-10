goog.provide 'aa.ui.Detail'

goog.require 'goog.array'
goog.require 'goog.object'


aa.ui.Detail = React.createClass
  statics:
    IMG_WIDTH: 0.75
    IMG_HEIGHT: 0.65

  getDefaultProps: ->
    'project': {}
    'activeSlide': 0
    'moveNext': no

  getActiveSlide: ->
    parseInt @props['activeSlide']

  getNextSlide: ->
    if @getActiveSlide() + 1 > @props['project']['slides'].length
      0
    else
      @getActiveSlide() + 1

  getPreviousSlide: ->
    if @getActiveSlide() - 1 < 0
      @props['project']['slides'].length
    else
      @getActiveSlide() - 1

  updateSizeAndPosition: ->
    actSlide = @getActiveSlide()
    console.log 'UPDATE'

    if actSlide is 0
      slide = @props['project']['slides'][actSlide]
    else
      slide = @props['project']['slides'][actSlide - 1]

    ow = slide['image']['size'][0]
    oh = slide['image']['size'][1]

    cw = goog.dom.getViewportSize().width
    ch = goog.dom.getViewportSize().height

    # by width
    iw = cw * aa.ui.Detail.IMG_WIDTH
    ih = oh / (ow / iw)

    # by height
    if Math.floor(ih) > ch * aa.ui.Detail.IMG_HEIGHT
      console.log 'pocitam pres vysku', ow, oh
      ih = ch * aa.ui.Detail.IMG_HEIGHT
      iw = ow / (oh / ih)

    @setState
      'img':
        'width': iw
        'height': ih
        'top': ch / 2 - ih / 2
        'left': cw / 2 - iw / 2
        'bottom': 'auto'
        'right': 'auto'

  handleResize: (e) ->
    @updateSizeAndPosition()
    return

  componentWillMount: ->
    console.log 'WILL MOUNT'
    @updateSizeAndPosition()

  componentWillUpdate: ->
    # @updateSizeAndPosition()
    console.log '------ TEST', @props['activeSlide']

  componentDidMount: ->
    window.addEventListener 'resize', @handleResize

  componentWillUnmount: ->
    window.removeEventListener 'resize', @handleResize

  render: ->
    console.log 'RENDER'
    project = @props['project']
    activeSlide = @getActiveSlide()
    nextSlide = @getNextSlide()
    previousSlide = @getPreviousSlide()

    return null if goog.object.isEmpty project

    slides = goog.array.clone project['slides']
    goog.array.insertAt slides, project, 0

    slideElements = []

    config =
      'key': 'project' + project['id']
      'className': 'aa-project-slide aa-actual-slide'

    console.log 'AX', @state['img']

    slideElements.push React.DOM.div config, [
        React.DOM.img
          'key': 'projectImg' + slides[activeSlide]['id']
          'src': slides[activeSlide]['image']['url']
          'style': @state['img']
      ,
        React.DOM.h2 'key': 'projectTitle' + slides[activeSlide]['id'], slides[activeSlide]['title']
      ]

    if slides.length > 1
      slideElements.push React.DOM.a {
        'key': 'next-slide'
        'className': 'aa-project-slide aa-next-slide'
        'href': '/#selected/' + project['id'] + '/' + nextSlide
      }, [
        React.DOM.img
          'key': 'projectImg' + slides[nextSlide]['id']
          'src': slides[nextSlide]['image']['url']
      ]

      slideElements.push React.DOM.a {
        'key': 'previous-slide'
        'className': 'aa-project-slide aa-previous-slide'
        'href': '/#selected/' + project['id'] + '/' + previousSlide
      }, [
        React.DOM.img
          'key': 'projectImg' + slides[previousSlide]['id']
          'src': slides[previousSlide]['image']['url']
      ]

    animation = React.createElement(React.addons.CSSTransitionGroup, {
      'className': 'aa-detail-transition', 'transitionName': 'detail-to-next', 'key': 'aa-detail-transition'
    }, React.DOM.div 'key': 'detail-list' + activeSlide, 'className': 'aa-detail-list', slideElements
    )

    config =
      'className': classNames
        'aa-page': yes
        'aa-page-detail': yes
      'style':
        'color': slides[activeSlide]['colors']['content']
        'backgroundColor': slides[activeSlide]['colors']['bg']
    React.DOM.div config, [
      animation,
      React.createElement aa.ui.Menu,
        'key': 'aa-content-menu'
        'colors': @props['project']?['colors']
      React.DOM.a
        'key': 'detail-closer'
        'className': 'aa-close'
        'href': '/#selected'
    ]

