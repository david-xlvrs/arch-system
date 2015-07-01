goog.provide 'aa.ui.DetailSlide'

goog.require 'aa.Router'
goog.require 'aa.ui.Fullscreen'
goog.require 'goog.array'
goog.require 'goog.object'


aa.ui.DetailSlide = React.createClass
  statics:
    IMG_WIDTH: 0.75
    IMG_HEIGHT: 0.65

  getDefaultProps: ->
    'project': {}
    'activeSlide': 0
    'moveNext': no
    'viewport':
      'width': 0
      'height': 0

  getInitialState: ->
    'mousePosition':
      'x': 0
      'y': 0

  getTextSlideContent: (slide) ->
    str = '<div class="columns">'
    str += slide['html']
    str += '</div>'

  getContent: (slideKey, way) ->
    slide = @props['project']['slides'][slideKey]

    switch slide['type']
      when 'image'
        React.DOM.img
          'key': 'projectImg' + slide['id']
          'src': slide['image']['url']
          'style': @getImageStyles slideKey, way
      when 'text'
        React.DOM.div
          'key': 'projectImg' + slide['id']
          'className': 'aa-text-content'
          'style': @getTextStyles slideKey, way
          'dangerouslySetInnerHTML':
            '__html': @getTextSlideContent slide

  getActiveSlide: ->
    parseInt @props['activeSlide']

  getNextSlide: ->
    if @getActiveSlide() + 1 >= @props['project']['slides'].length
      0
    else
      @getActiveSlide() + 1

  getPreviousSlide: ->
    if @getActiveSlide() - 1 < 0
      @props['project']['slides'].length - 1
    else
      @getActiveSlide() - 1

  getImageStyles: (pos, type) ->
    slide = @props['project']['slides'][pos]
    ratio = slide['image']['size'][0] / slide['image']['size'][1]

    cw = @props['viewport']['width']
    ch = @props['viewport']['height']

    menuHeight = aa.Const.CSS.MENU.HEIGHT
    titleHeight = aa.Const.CSS.TITLE.HEIGHT

    idealH = ch - 8 * aa.Const.CSS.SIZE1 - 2 * titleHeight
    idealW = cw - 4 * aa.Const.CSS.SIZE1

    maxH = Math.min idealH, slide['image']['size'][1]
    maxW = Math.min idealW, slide['image']['size'][0]

    # by width
    iw = maxW
    ih = iw / ratio

    # by height
    if Math.floor(ih) > maxH
      ih = maxH
      iw = ih * ratio

    ret =
      'width': iw
      'height': ih
      'marginTop': titleHeight + aa.Const.CSS.SIZE1 * 4 + (idealH - ih) / 2

    if type is 'next'
      ret['marginLeft'] = 'auto'
      ret['marginRight'] = -(iw - aa.Const.CSS.SIZE1)
    else if type is 'previous'
      ret['marginLeft'] = -(iw - aa.Const.CSS.SIZE1)

    # need fullscreen?
    fullSize = @props['project']['slides'][pos]['fullImage']['size']
    ret['fullscreen'] = maxW < fullSize[0] or maxH < fullSize[1]

    ret

  getTextStyles: (pos, type) ->
    slide = @props['project']['slides'][pos]

    cw = @props['viewport']['width']
    ch = @props['viewport']['height']

    menuHeight = aa.Const.CSS.MENU.HEIGHT
    titleHeight = aa.Const.CSS.TITLE.HEIGHT

    ih = ch - 8 * aa.Const.CSS.SIZE1 - 2 * titleHeight
    iw = cw * 0.65 - 4 * aa.Const.CSS.SIZE1

    ret =
      'width': iw
      'height': ih
      'marginTop': titleHeight + aa.Const.CSS.SIZE1 * 4

    if type is 'next'
      ret['marginLeft'] = 'auto'
      ret['marginRight'] = -(iw - aa.Const.CSS.SIZE1)
    else if type is 'previous'
      ret['marginLeft'] = -(iw - aa.Const.CSS.SIZE1)

    ret

  componentDidMount: ->
    goog.events.listen window, goog.events.EventType.MOUSEMOVE, @handleMove
    goog.events.listen window, goog.events.EventType.KEYUP, @handleKey

  componentWillUnmount: ->
    goog.events.unlisten window, goog.events.EventType.MOUSEMOVE, @handleMove
    goog.events.unlisten window, goog.events.EventType.KEYUP, @handleKey

  handleMove: (e) ->
    @setState
      'mousePosition':
        'x': e.clientX
        'y': e.clientY

  handleKey: (e) ->
    if @props['inFullscreen']
      e.preventDefault()
      e.stopPropagation()
      return

    switch e.keyCode
      when 37 #Left
        @onPreviousClick()
        window.location.href = aa.Router.getRoute aa.Const.SECTION.DETAIL, @props['project']['slug'], @getPreviousSlide()
      when 39 #Right
        @onNextClick()
        window.location.href = aa.Router.getRoute aa.Const.SECTION.DETAIL, @props['project']['slug'], @getNextSlide()
      when 38 #Up
        window.location.href = aa.Router.getRoute aa.Const.SECTION.DETAIL, @props['project']['previousProject']['slug'], 0
      when 40 #Down
        window.location.href = aa.Router.getRoute aa.Const.SECTION.DETAIL, @props['project']['nextProject']['slug'], 0
      when 27 #Esc
        window.location.href = aa.Router.getRoute @props['previousSection']

  onNextClick: (ev) ->
    window.detailDirection = 1

  onPreviousClick: (ev) ->
    window.detailDirection = 0

  render: ->
    project = @props['project']
    activeSlide = @getActiveSlide()
    nextSlide = @getNextSlide()
    previousSlide = @getPreviousSlide()

    return null if goog.object.isEmpty project

    slides = project['slides']

    content = []

    #1-menu
    content.push React.createElement aa.ui.Menu,
        'key': 'aa-content-menu'
        'justOne':
          switch @props['previousSection']
            when aa.Const.SECTION.SELECTED then 'selected'
            when aa.Const.SECTION.INDEX then 'index'
        'colors':
          'content': slides[activeSlide]?['colors']['content']

    #2-counter
    spanConfig =
      'key': 'counter' + activeSlide
      'className': 'aa-detail-counter'
      'style':
        'color': slides[activeSlide]?['colors']['content']
    content.push React.DOM.span spanConfig,
        (activeSlide + 1) + '/' + slides.length

    #3-slide title
    content.push React.createElement aa.ui.SelectedTitle,
      'clickable': no
      'className': 'aa-slide-title'
      'key': 'slideTitle'
      'projects': [slides[activeSlide]]

    #4-project title
    content.push React.createElement aa.ui.SelectedTitle,
      'clickable': no
      'key': 'projectTitle'
      'projects': [project]
      'imagePositions': [0]

    #5-close
    content.push React.DOM.a
      'key': 'detail-closer'
      'className': 'aa-close'
      'href': aa.Router.getRoute @props['previousSection']
      'dangerouslySetInnerHTML':
        '__html': '&#10005;'


    #6-actual slide
    if slides[activeSlide]['type'] is 'image'
      actualStyles = @getImageStyles activeSlide
    else
      actualStyles = @getTextStyles activeSlide
    config =
      'key': 'project' + project['id']
      'className': 'aa-project-slide aa-actual-slide'
      'style': actualStyles
    if actualStyles['fullscreen']
      config['className'] += ' aa-fullscreen'
      config['href'] = aa.Router.getRoute aa.Const.SECTION.DETAIL, project['slug'], activeSlide, 'full'
    content.push React.DOM.a config, @getContent activeSlide

    if slides.length > 1
      #7-next slide
      content.push React.DOM.a {
        'key': 'next-slide'
        'onClick': @onNextClick
        'className': 'aa-project-slide aa-next-slide'
        'href': aa.Router.getRoute aa.Const.SECTION.DETAIL, project['slug'], nextSlide
        'style':
          'width': (@props['viewport']['width'] - actualStyles['width']) / 2
      }, @getContent nextSlide, 'next'

      #8-previous slide
      content.push React.DOM.a {
        'key': 'previous-slide'
        'onClick': @onPreviousClick
        'className': 'aa-project-slide aa-previous-slide'
        'href': aa.Router.getRoute aa.Const.SECTION.DETAIL, project['slug'], previousSlide
        'style':
          'width': (@props['viewport']['width'] - actualStyles['width']) / 2
      },  @getContent previousSlide, 'previous'

    #9-fullscreen
    content.push React.createElement(React.addons.CSSTransitionGroup, {
      'transitionName': aa.Const.TRANSITION.FULLSCREEN, 'key': 'fullscreen-transition'},
        if @props['inFullscreen']
          React.createElement aa.ui.Fullscreen,
            'key': 'aa-fullscreen-container'
            'className': 'aa-fullscreen-container'
            'colors': slides[activeSlide]?['colors']
            'slide': slides[activeSlide]
            'mousePosition': @state['mousePosition']
            'returnUrl': aa.Router.getRoute aa.Const.SECTION.DETAIL, project['slug'], activeSlide
        else
          null
      )

    #10-previous project
    config =
      'className': 'aa-detail-previous-project'
      'key': 'aa-detail-previous-project'
      'href': aa.Router.getRoute aa.Const.SECTION.DETAIL, project['previousProject']['slug'], 0
    spanConfig =
      'style':
        'backgroundColor': project['previousProject']['colors']['bg']
    content.push React.DOM.a config, React.DOM.span spanConfig, ''

    #10-next project
    config =
      'className': 'aa-detail-next-project'
      'key': 'aa-detail-next-project'
      'href': aa.Router.getRoute aa.Const.SECTION.DETAIL, project['nextProject']['slug'], 0
    spanConfig =
      'style':
        'backgroundColor': project['nextProject']['colors']['bg']
    content.push React.DOM.a config, React.DOM.span spanConfig, ''

    React.DOM.div undefined, content

