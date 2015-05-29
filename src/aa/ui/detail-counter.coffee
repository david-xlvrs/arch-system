goog.provide 'aa.ui.DetailCounter'

goog.require 'goog.dom'

aa.ui.DetailCounter = React.createClass
  getDefaultProps: ->
    'active': 1
    'total': 1
    'color': ''

  render: ->

    transitionConfig =
      'className': 'aa-detail-counter'
      'key': 'aa-detail-counter-transition'
      'transitionName': 'fading-counter'

    spanConfig =
      'key': 'counter' + @props['active']
      'style':
        'color': @props['color']

    React.createElement React.addons.CSSTransitionGroup, transitionConfig,
      React.DOM.span spanConfig,
        @props['active'] + '/' + @props['total']
