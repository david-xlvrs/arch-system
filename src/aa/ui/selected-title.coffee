goog.provide 'aa.ui.SelectedTitle'

goog.require 'goog.dom'

aa.ui.SelectedTitle = React.createClass
  getDefaultProps: ->
    'className': 'aa-project-title'
    'clickable': yes
    'projects': []
    'imagePositions': [0]

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
    actualSlide = 0
    for imagePosition, iter in @props['imagePositions']
      if imagePosition - 20 > @state['scroll']
        actualSlide = iter
        break

    configA = {}
    if @props['clickable']
      configA['className'] = 'clickable'
      configA['href'] = '/#selected/' + @props['projects'][actualSlide]['id'] + '/0'

    React.createElement React.addons.CSSTransitionGroup, 'key': 'aa-title-transition', 'transitionName': 'fixed-title',
      React.DOM.h2 'key': 'h2-' + actualSlide, 'className': @props['className'],
        React.DOM.a configA, @props['projects'][actualSlide]['title']
