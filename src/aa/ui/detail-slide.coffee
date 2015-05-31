goog.provide 'aa.ui.DetailSlide'

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
            '__html': slide['html']

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

    maxH = ch - 4 * aa.Const.CSS.SIZE1 - 2 * titleHeight
    maxW = cw - 4 * aa.Const.CSS.SIZE1

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
      'marginTop': titleHeight + aa.Const.CSS.SIZE1 * 2

    if type is 'next'
      ret['marginLeft'] = 'auto'
      ret['marginRight'] = -(iw - aa.Const.CSS.SIZE1)
    else if type is 'previous'
      ret['marginLeft'] = -(iw - aa.Const.CSS.SIZE1)

    ret

  getTextStyles: (pos, type) ->
    slide = @props['project']['slides'][pos]

    cw = @props['viewport']['width']
    ch = @props['viewport']['height']

    menuHeight = aa.Const.CSS.MENU.HEIGHT
    titleHeight = aa.Const.CSS.TITLE.HEIGHT

    ih = ch - 4 * aa.Const.CSS.SIZE1 - 2 * titleHeight
    iw = cw*0.75 - 4 * aa.Const.CSS.SIZE1

    console.log 'slide', slide['colors']

    ret =
      'background': slide['colors']['content']
      'color': slide['colors']['bg']
      'width': iw
      'height': ih
      'marginTop': titleHeight + aa.Const.CSS.SIZE1 * 2

    if type is 'next'
      ret['marginLeft'] = 'auto'
      ret['marginRight'] = -(iw - aa.Const.CSS.SIZE1)
    else if type is 'previous'
      ret['marginLeft'] = -(iw - aa.Const.CSS.SIZE1)

    ret

  getAndSaveViewportSize: ->
    @setState
      'viewport':
        'width': goog.dom.getViewportSize().width
        'height': goog.dom.getViewportSize().height

  handleResize: (e) ->
    @getAndSaveViewportSize()

  componentWillMount: ->
    @getAndSaveViewportSize()

  componentDidMount: ->
    window.addEventListener 'resize', @handleResize

  componentWillUnmount: ->
    window.removeEventListener 'resize', @handleResize

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
        'colors': @props['project']?['colors']

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
      'href': '/#selected'
    , 'X'

    #6-actual slide
    if slides[activeSlide]['type'] is 'image'
      actualStyles = @getImageStyles activeSlide
    else
      actualStyles = @getTextStyles activeSlide
    config =
      'key': 'project' + project['id']
      'className': 'aa-project-slide aa-actual-slide'
      'style': actualStyles
    content.push React.DOM.a config, @getContent activeSlide

    if slides.length > 1
      #7-next slide
      content.push React.DOM.a {
        'key': 'next-slide'
        'onClick': @onNextClick
        'className': 'aa-project-slide aa-next-slide'
        'href': '/#selected/' + project['id'] + '/' + nextSlide
        'style':
          'width': (@props['viewport']['width'] - actualStyles['width']) / 2
      }, @getContent nextSlide, 'next'

      #8-previous slide
      content.push React.DOM.a {
        'key': 'previous-slide'
        'onClick': @onPreviousClick
        'className': 'aa-project-slide aa-previous-slide'
        'href': '/#selected/' + project['id'] + '/' + previousSlide
        'style':
          'width': (@props['viewport']['width'] - actualStyles['width']) / 2
      },  @getContent previousSlide, 'previous'

    React.DOM.div undefined, content

