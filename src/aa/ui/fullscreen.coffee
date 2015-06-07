goog.provide 'aa.ui.Fullscreen'

aa.ui.Fullscreen = React.createClass
  statics:
    TOLERANCE: 20

  handleMove: (clientX, clientY) ->
    viewX = goog.dom.getViewportSize().width - 2 * aa.ui.Fullscreen.TOLERANCE
    viewY = goog.dom.getViewportSize().height - 2 * aa.ui.Fullscreen.TOLERANCE

    imgX = @props['slide']['fullImage']['size'][0]
    imgY = @props['slide']['fullImage']['size'][1]

    x = clientX - aa.ui.Fullscreen.TOLERANCE
    y = clientY - aa.ui.Fullscreen.TOLERANCE
    percX = Math.min 1, Math.max x / viewX, 0
    percY = Math.min 1, Math.max y / viewY, 0

    moveX = imgX - viewX - 2 * aa.ui.Fullscreen.TOLERANCE
    moveY = imgY - viewY - 2 * aa.ui.Fullscreen.TOLERANCE

    'left': -moveX * percX
    'top': -moveY * percY

  handleKey: (e) ->
    e.preventDefault()
    e.stopPropagation()

    if e.keyCode is 27 #Esc
      window.location.href = @props['returnUrl']

  componentDidMount: ->
    goog.events.listen window, goog.events.EventType.KEYUP, @handleKey

  componentWillUnmount: ->
    goog.events.unlisten window, goog.events.EventType.KEYUP, @handleKey

  render: ->
    content = []

    content.push React.DOM.img
      'key': 'fullImg' + @props['slide']['id']
      'src': @props['slide']['image']['url']
      'style': @handleMove @props['mousePosition']['x'], @props['mousePosition']['y']

    content.push React.DOM.a
      'key': 'detail-closer'
      'className': 'aa-close'
      'href': @props['returnUrl']
    , 'X'

    React.DOM.div 'className': @props['className'], content
