goog.provide 'aa.ui.SelectedCounter'

goog.require 'goog.dom'

aa.ui.SelectedCounter = React.createClass
  getDefaultProps: ->
    'className': 'aa-project-counter'
    'projects': []
    'actualSlide': 0
    'onClick': (number) ->
    'onMouseEnter': () ->
    'onMouseLeave': () ->

  render: ->
    actualSlide = @props['actualSlide']
    if actualSlide is @props['projects'].length
      actualSlide = 0

    configA =
      'className': 'clickable'
      'onClick': (e) => @props['onClick'] actualSlide
      'onMouseEnter': (e) => @props['onMouseEnter']()
      'onMouseLeave': (e) => @props['onMouseLeave']()
      'style':
        'color': @props['projects'][@props['actualSlide'] - 1]['colors']['bg']

    configA['className'] += ' hover' if @props['hovered']

    if actualSlide is 0
      text = "Back to the top"
      configA['className'] += ' back-to-top'
    else
      text = "Next Project (#{actualSlide + 1}/#{@props['projects'].length})"

    # React.createElement React.addons.CSSTransitionGroup, 'key': 'aa-title-transition', 'transitionName': 'fixed-title',
    React.DOM.h2 'key': 'h2-' + actualSlide, 'className': @props['className'],
      React.DOM.a configA, text
