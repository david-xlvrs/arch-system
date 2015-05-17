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

  render: ->
    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']

    content.push React.DOM.span 'className': 'empty', 'key': 'dummyElement'

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
