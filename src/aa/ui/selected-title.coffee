goog.provide 'aa.ui.SelectedTitle'

goog.require 'goog.dom'

aa.ui.SelectedTitle = React.createClass
  getDefaultProps: ->
    'className': 'aa-project-title'
    'clickable': yes
    'projects': []
    'actualSlide': 0



  render: ->
    actualSlide = @props['actualSlide']
    configA = {}
    if @props['clickable']
      configA['className'] = 'clickable'
      configA['href'] = '/#selected/' + @props['projects'][actualSlide]['id'] + '/0'
      configA['style'] =
        'color': @props['projects'][actualSlide]['colors']['bg']

    React.createElement React.addons.CSSTransitionGroup, 'key': 'aa-title-transition', 'transitionName': 'fixed-title',
      React.DOM.h2 'key': 'h2-' + actualSlide, 'className': @props['className'],
        React.DOM.a configA, @props['projects'][actualSlide]['title']
