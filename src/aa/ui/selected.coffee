goog.provide 'aa.ui.Selected'

goog.require 'goog.style'


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

    maxH = ch - 4 * aa.Const.CSS.SIZE1 - 50 - 40 # 50 je vyska menu, 40 je vyska nadpisu
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
    'marginTop': if pos then (40 + aa.Const.CSS.SIZE1 * 2) else (50 + aa.Const.CSS.SIZE1)
    'marginBottom': if pos is @props['projects'].length - 1 then (40 + aa.Const.CSS.SIZE1 * 3)

  render: ->
    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']

    content.push React.DOM.span 'className': 'empty'

    if @props['projects']?.length

      imagePositions = []

      for project, iter in @props['projects']
        config =
          'key': 'project' + project['id']
          'className': 'aa-project-slide'
          'href': '/#selected/' + project['id'] + '/0'
          'style': imageStyles = @getImageStyles iter

        # count positions of images
        imagePositions[iter] = imageStyles['marginTop'] + (imagePositions[iter] or 0)
        imagePositions[iter] += position for position in imagePositions[0...iter]
        imagePositions[iter + 1] = imageStyles['height'] unless iter + 1 is @props['projects'].length

        content.push React.DOM.a config,
          React.DOM.img
            'key': 'projectImg' + project['id']
            'src': project['image']['url']

      content.push React.createElement aa.ui.SelectedTitle,
        'key': 'projectTitle'
        'projects': @props['projects']
        'imagePositions': imagePositions

    config =
      'className': classNames ['aa-content', 'aa-content-selected']
    React.DOM.div config, content


aa.ui.SelectedTitle = React.createClass
  getDefaultProps: ->
    'projects': []
    'imagePositions': []

  getScrollCount: ->
    @setState
      'scroll': goog.dom.getDocumentScroll().y

  handleScroll: (e) ->
    @getScrollCount()

  componentWillMount: ->
    @getScrollCount()

  componentDidMount: ->
    window.addEventListener 'scroll', @handleScroll

  componentWillUnmount: ->
    window.removeEventListener 'scroll', @handleScroll

  render: ->
    for imagePosition, iter in @props['imagePositions']
      if imagePosition - 20 > @state['scroll']
        actualSlide = iter
        break

    React.createElement React.addons.CSSTransitionGroup, 'key': 'aa-title-transition', 'transitionName': 'fixed-title',
      React.DOM.h2 'key': 'h2-' + actualSlide, 'className': 'project-title',
        React.DOM.a 'href': '/#selected/' + @props['projects'][actualSlide]['id'] + '/0', @props['projects'][actualSlide]['title']
