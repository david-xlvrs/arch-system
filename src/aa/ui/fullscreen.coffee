goog.provide 'aa.ui.Fullscreen'

aa.ui.Fullscreen = React.createClass
  statics:
    TOLERANCE: 20

  countImagePosition: (clientX, clientY) ->
    screenX = goog.dom.getViewportSize().width
    screenY = goog.dom.getViewportSize().height

    viewX = screenX - 2 * aa.ui.Fullscreen.TOLERANCE
    viewY = screenY - 2 * aa.ui.Fullscreen.TOLERANCE

    imgX = @props['slide']['fullImage']['size'][0]
    imgY = @props['slide']['fullImage']['size'][1]

    x = clientX - aa.ui.Fullscreen.TOLERANCE
    y = clientY - aa.ui.Fullscreen.TOLERANCE
    percX = Math.min 1, Math.max x / viewX, 0
    percY = Math.min 1, Math.max y / viewY, 0

    moveX = imgX - viewX - 2 * aa.ui.Fullscreen.TOLERANCE
    moveY = imgY - viewY - 2 * aa.ui.Fullscreen.TOLERANCE

    'left': if imgX > screenX then -moveX * percX else (screenX - imgX) / 2
    'top': if imgY > screenY then -moveY * percY else (screenY - imgY) / 2

  handleClick: (e) ->
    if e.target.tagName is 'IMG'
      window.location.href = @props['returnUrl']

  handleKey: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if e.keyCode is 27 #Esc
      window.location.href = @props['returnUrl']

  componentDidMount: ->
    goog.events.listen window, goog.events.EventType.CLICK, @handleClick
    goog.events.listen window, goog.events.EventType.KEYUP, @handleKey

  componentWillUnmount: ->
    goog.events.unlisten window, goog.events.EventType.CLICK, @handleClick
    goog.events.unlisten window, goog.events.EventType.KEYUP, @handleKey

  render: ->
    content = []

    content.push React.DOM.img
      'key': 'fullImg' + @props['slide']['id']
      'src': @props['slide']['image']['url']
      'style': @countImagePosition @props['mousePosition']['x'], @props['mousePosition']['y']

    content.push React.DOM.a
      'key': 'detail-closer'
      'className': 'aa-close'
      'href': @props['returnUrl']
      'dangerouslySetInnerHTML':
        '__html': '&#10005;'

    config =
      'className': @props['className']
      'style':
        'backgroundColor': @props['colors']['bg']

    React.DOM.div config, content
