goog.provide 'aa.ui.transition.Basic'

goog.require 'goog.style'
goog.require 'aa.Const'
goog.require 'aa.ui.transition.Config'

aa.ui.transition.Basic = React.createClass
  getDefaultProps: ->
    'section': null
    'sectionProps': {}
    'fromColors': {}
    'toColors': {}
    'transition': ''

  getRealLeaveTransition: (transition) ->
    if transition is aa.Const.TRANSITION.SPLASH_2_SECTION and window.newTransition isnt aa.Const.TRANSITION.SPLASH_2_SECTION
      aa.Const.TRANSITION.SECTION_2_SECTION
    else
      transition

  componentWillEnter: (callback) ->
    transition = @props['transition']

    console.log 'componentWillEnter', transition
    requestAnimationFrame =>
      goog.dom.classes.add @getDOMNode(), "#{transition}-enter"
      aa.ui.transition.Config[transition]?['enter']? @

      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{transition}-enter-active"
        aa.ui.transition.Config[transition]?['enter-active']? @
        window.setTimeout callback, aa.ui.transition.Config[transition]['duration']

  componentDidEnter: ->
    transition = @props['transition']

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
    goog.dom.classes.remove @getDOMNode(), "#{transition}-leave", "#{transition}-leave-active"

  render: ->
    config =
      'className': classNames ['aa-page']
      'style':
        'backgroundColor': @props['toColors']['bg']
    React.DOM.div config, React.createElement @props['section'], @props['sectionProps']
