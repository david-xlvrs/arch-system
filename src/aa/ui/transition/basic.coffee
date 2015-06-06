goog.provide 'aa.ui.transition.Basic'

goog.require 'goog.style'
goog.require 'aa.Const'
goog.require 'aa.ui.transition.Config'

aa.ui.transition.Basic = React.createClass
  getDefaultProps: ->
    'section': null
    'sectionProps': {}
    'transition': ''

  getRealLeaveTransition: (transition) ->
    transition

  componentWillEnter: (callback) ->
    transition = @getRealLeaveTransition @props['transition']

    console.log 'componentWillEnter', transition
    requestAnimationFrame =>
      goog.dom.classes.add @getDOMNode(), "#{transition}-enter"
      aa.ui.transition.Config[transition]?['enter']? @

      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{transition}-enter-active"
        aa.ui.transition.Config[transition]?['enter-active']? @
        window.setTimeout callback, aa.ui.transition.Config[transition]['duration']

  componentDidEnter: ->
    transition = @getRealLeaveTransition @props['transition']

    goog.dom.classes.remove @getDOMNode(), "#{transition}-enter", "#{transition}-enter-active"
    console.log 'componentDidEnter', transition

  componentWillLeave: (callback) ->
    transition = @getRealLeaveTransition @props['transition']

    console.log 'componentWillLeave', transition
    requestAnimationFrame =>
      goog.dom.classes.add @getDOMNode(), "#{transition}-leave"
      aa.ui.transition.Config[transition]?['leave']? @

      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{transition}-leave-active"
        aa.ui.transition.Config[transition]?['leave-active']? @

        window.setTimeout callback, aa.ui.transition.Config[transition]['duration']

  componentDidLeave: () ->
    transition = @getRealLeaveTransition @props['transition']

    console.log 'componentDidLeave', transition
    # goog.dom.classes.remove @getDOMNode(), "#{transition}-leave", "#{transition}-leave-active"

  render: ->
    React.createElement @props['section'], @props['sectionProps']
