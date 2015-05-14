goog.provide 'aa.ui.transition.Basic'

goog.require 'goog.style'
goog.require 'aa.Const'
goog.require 'aa.ui.transition.Config'

aa.ui.transition.Basic = (section) ->
  React.createClass
    getDefaultProps: ->
      'fromColors': {}
      'toColors': {}
      'transition': ''

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

      goog.dom.classes.remove @getDOMNode(), "#{@props['transition']}-enter", "#{@props['transition']}-enter-active"
      console.log 'componentDidEnter', @props['transition']

    componentWillLeave: (callback) ->
      transition = @props['transition']
      if transition is aa.Const.TRANSITION.SPLASH_TO_SECTION and window.newTransition is aa.Const.TRANSITION.SECTION_TO_SECTION
        transition = window.newTransition

      console.log 'componentWillLeave', transition
      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{transition}-leave"
        aa.ui.transition.Config[transition]?['leave']? @

        requestAnimationFrame =>
          goog.dom.classes.add @getDOMNode(), "#{transition}-leave-active"
          aa.ui.transition.Config[transition]?['leave-active']? @
          window.setTimeout callback, aa.ui.transition.Config[transition]['duration']

    componentDidLeave: () ->
      transition = @props['transition']

      console.log 'componentDidLeave', transition
      goog.dom.classes.remove @getDOMNode(), "#{transition}-leave", "#{transition}-leave-active"

    render: ->
      config =
        'className': classNames ['aa-page']
        'style':
          'backgroundColor': @props['toColors']['bg']
      React.DOM.div config, section #mozna neni potreba div, staci vratit tu sekci
