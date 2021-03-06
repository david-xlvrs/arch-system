goog.provide 'aa.ui.SelectedTitle'

goog.require 'goog.dom'

aa.ui.SelectedTitle = React.createClass
  getDefaultProps: ->
    'className': 'aa-project-title'
    'clickable': yes
    'projects': []
    'actualSlide': 0
    'onMouseEnter': () ->
    'onMouseLeave': () ->

  render: ->
    actualSlide = @props['actualSlide']
    configA =
      'onMouseEnter': (e) => @props['onMouseEnter']()
      'onMouseLeave': (e) => @props['onMouseLeave']()

    if @props['clickable']
      configA['className'] = 'clickable'
      configA['href'] = aa.Router.getRoute aa.Const.SECTION.DETAIL, @props['projects'][actualSlide]['slug'], 0
      configA['style'] =
        'color': @props['projects'][actualSlide]['colors']['bg']

    configA['className'] += ' hover' if @props['hovered']

    React.createElement React.addons.CSSTransitionGroup, 'key': 'aa-title-transition', 'transitionName': 'fixed-title',
      React.DOM.h2 'key': 'h2-' + actualSlide, 'className': @props['className'],
        React.DOM.a configA, @props['projects'][actualSlide]['title']
