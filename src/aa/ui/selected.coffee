goog.provide 'aa.ui.Selected'

goog.require 'goog.style'
goog.require 'aa.ui.SelectedTitle'
goog.require 'aa.Const'

aa.ui.Selected = React.createClass
  getDefaultProps: ->
    'projects': []
    'activeProject': 0
    'colors': {}
    'viewport':
      'width': 0
      'height': 0

  getActualSlide: ->
    0

  getImageStyles: (pos) ->
    slide = @props['projects'][pos]
    ow = slide['image']['size'][0]
    oh = slide['image']['size'][1]
    ratio = ow / oh

    cw = @props['viewport']['width']
    ch = @props['viewport']['height']

    menuHeight = aa.Const.CSS.MENU.HEIGHT
    titleHeight = aa.Const.CSS.TITLE.HEIGHT

    maxH = ch - 4 * aa.Const.CSS.SIZE1 - menuHeight - titleHeight
    maxW = cw - 4 * aa.Const.CSS.SIZE1

    # console.log "cw #{cw}, ch #{ch}, maxH #{maxH}, maxW #{maxW}"

    # by width
    iw = maxW
    ih = iw / ratio

    # by height
    if Math.floor(ih) > maxH
      ih = maxH
      iw = ih * ratio

    'width': iw
    'height': ih
    'marginTop': if pos then (titleHeight + aa.Const.CSS.SIZE1 * 2) else (menuHeight + aa.Const.CSS.SIZE1)
    'marginBottom': if pos is @props['projects'].length - 1 then (titleHeight + aa.Const.CSS.SIZE1 * 3)

  getScrollCount: ->
    @setState
      'scroll': goog.dom.getDocumentScroll().y

  handleScroll: (e) ->
    @getScrollCount()

  componentWillMount: ->
    @getScrollCount()

  componentDidMount: ->
    window.addEventListener 'scroll', @handleScroll
    window.addEventListener 'keyup', @handleKey

  componentWillUnmount: ->
    window.removeEventListener 'scroll', @handleScroll

  render: ->
    return React.DOM.div null, 'EMPTY' unless @props['projects']

    imagesStyles = []
    imagePositions = []
    for project, iter in @props['projects']
      imagesStyles.push imageStyles =  @getImageStyles iter

      # count positions of images
      imagePositions[iter] = imageStyles['marginTop'] + (imagePositions[iter] or 0)
      imagePositions[iter] += position for position in imagePositions[0...iter]
      imagePositions[iter + 1] = imageStyles['height'] unless iter + 1 is @props['projects'].length

    actualSlide = 0
    for imagePosition, iter in imagePositions
      if imagePosition - 20 > @state['scroll']
        actualSlide = iter
        break

    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors':
        'content': @props['projects'][actualSlide]['colors']['bg']

    content.push React.DOM.span 'className': 'empty', 'key': 'dummyElement'

    if @props['projects']?.length

      for project, iter in @props['projects']
        config =
          'key': 'project' + project['id']
          'className': 'aa-project-slide'
          'href': '/#selected/' + project['id'] + '/0'
          'style': imagesStyles[iter]

        content.push React.DOM.a config,
          React.DOM.img
            'key': 'projectImg' + project['id']
            'src': project['image']['url']

      content.push React.createElement aa.ui.SelectedTitle,
        'key': 'projectTitle'
        'projects': @props['projects']
        'actualSlide': actualSlide

    config =
      'className': classNames ['aa-content', 'aa-content-selected']
    React.DOM.div config, content
