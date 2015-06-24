goog.provide 'aa.ui.Selected'

goog.require 'goog.events'
goog.require 'goog.style'
goog.require 'aa.ui.SelectedTitle'
goog.require 'aa.ui.SelectedCounter'
goog.require 'aa.Const'

aa.ui.Selected = React.createClass
  getDefaultProps: ->
    'projects': []
    'activeProject': 0
    'colors': {}
    'viewport':
      'width': 0
      'height': 0

  getImageStyles: (pos) ->
    slide = @props['projects'][pos]
    ow = slide['image']['size'][0]
    oh = slide['image']['size'][1]
    ratio = ow / oh

    cw = @props['viewport']['width']
    ch = @props['viewport']['height']

    menuHeight = aa.Const.CSS.MENU.HEIGHT
    titleHeight = aa.Const.CSS.TITLE.HEIGHT

    maxH = ch - 8 * aa.Const.CSS.SIZE1 - menuHeight - titleHeight
    maxW = cw - 4 * aa.Const.CSS.SIZE1

    # by width
    iw = maxW
    ih = iw / ratio

    # by height
    if Math.floor(ih) > maxH
      ih = maxH
      iw = ih * ratio

    'width': iw
    'height': ih
    'marginTop': if pos then (titleHeight + aa.Const.CSS.SIZE1 * 3) else (menuHeight + 4 * aa.Const.CSS.SIZE1)
    'paddingBottom': if pos is @props['projects'].length - 1 then (titleHeight + aa.Const.CSS.SIZE1 * 4)

  highlightNext: (hovered) ->
    @setState
      'nextHover': hovered

  getScrollCount: ->
    @setState
      'scroll': goog.dom.getDocumentScroll().y

  handleScroll: (e) ->
    @getScrollCount()

  goNext: (iter) ->
    scrollTo = 0
    scrollTo += style['height'] for style in window.selectedImagesStyles[0...iter]
    scrollTo += style['marginTop'] for style in window.selectedImagesStyles[1..iter]

    @props['handleScrollTo'] parseInt scrollTo

  handleKey: (e) ->
    switch e.keyCode
      when 38 #Up
        e.preventDefault()
        iter = window.selectedActualSlide - 1
        scrollTo = 0
        scrollTo += style['height'] for style in window.selectedImagesStyles[0...iter]
        scrollTo += style['marginTop'] for style in window.selectedImagesStyles[1..iter]

        @props['handleScrollTo'] parseInt scrollTo
      when 40 #Down
        e.preventDefault()
        iter = window.selectedActualSlide + 1
        if iter is window.selectedImagesStyles.length
          iter = 0

        @goNext iter

  handleSlideClick: (e) ->
    e.preventDefault() #390
    if scrollTo = e.target?.getAttribute 'data-scroll-to'
      @props['handleScrollTo'] parseInt scrollTo

  componentWillMount: ->
    @getScrollCount()

  componentDidMount: ->
    goog.events.listen window, goog.events.EventType.SCROLL, @handleScroll
    goog.events.listen window, goog.events.EventType.KEYDOWN, @handleKey

  componentWillUnmount: ->
    goog.events.unlisten window, goog.events.EventType.SCROLL, @handleScroll
    goog.events.unlisten window, goog.events.EventType.KEYDOWN, @handleKey

  render: ->
    return React.DOM.div null, 'EMPTY' unless @props['projects']

    imagesStyles = []
    imagePositions = []
    for project, iter in @props['projects']
      imagesStyles.push imageStyles =  @getImageStyles iter

      # count positions of images
      imagePositions[iter] = imageStyles['marginTop'] + imageStyles['height'] + (imagePositions[iter - 1] or 0)

    actualSlide = 0
    for imagePosition, iter in imagePositions
      if imagePosition - 40 > @state['scroll']
        actualSlide = iter
        break

    nextSlide = 1
    for imagePosition, iter in imagePositions
      if imagePosition - 100 > @state['scroll']
        nextSlide = iter + 1
        break

    #TODO: vyresit jinak predavani do klavesovych event
    window.selectedActualSlide = actualSlide
    window.selectedImagesStyles = imagesStyles

    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'active': 'selected'
      'colors':
        'content': @props['projects'][actualSlide]['colors']['bg']

    content.push React.DOM.span 'className': 'empty', 'key': 'dummyElement'

    if @props['projects']?.length

      content.push React.createElement aa.ui.SelectedCounter,
        'key': 'projectCounter'
        'onClick': (number) => @goNext number
        'onMouseEnter': () => @highlightNext yes
        'onMouseLeave': () => @highlightNext no
        'projects': @props['projects']
        'hovered': @state['nextHover']
        'actualSlide': nextSlide

      for project, iter in @props['projects']
        config =
          'key': 'project' + project['id']
          'className': 'aa-project-slide'
          'href': aa.Router.getRoute aa.Const.SECTION.DETAIL, project['slug'], 0
          'style': imagesStyles[iter]

        if actualSlide isnt iter
          config['onClick'] = @handleSlideClick
          if actualSlide > iter
            config['className'] += ' aa-previous'
          else
            config['className'] += ' hover' if @state['nextHover']
            config['className'] += ' aa-next'
            config['onMouseEnter'] = (e) => @highlightNext yes
            config['onMouseLeave'] = (e) => @highlightNext no
        else
          config['className'] += ' aa-actual'

        scrollTo = 0
        if iter > 0
          scrollTo += style['height'] for style in imagesStyles[0...iter]
          scrollTo += style['marginTop'] for style in imagesStyles[1..iter]

        content.push React.DOM.a config,
          React.DOM.img
            'key': 'projectImg' + project['id']
            'data-scroll-to': scrollTo
            'src': project['image']['url']

      content.push React.createElement aa.ui.SelectedTitle,
        'key': 'projectTitle'
        'projects': @props['projects']
        'actualSlide': actualSlide

    config =
      'className': classNames ['aa-content', 'aa-content-selected']
    React.DOM.div config, content
