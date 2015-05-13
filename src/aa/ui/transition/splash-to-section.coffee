goog.provide 'aa.ui.transition.SplashToSection'

goog.require 'goog.style'


aa.ui.transition.SplashToSection = (section) ->
  React.createClass
    getDefaultProps: ->
      'fromColors': {}
      'toColors': {}
      'transition': ''

    componentWillEnter: (callback) ->
      console.log 'componentWillEnter', @props['transition']
      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-enter"
        goog.style.setStyle @getDOMNode(), 'background-color', @props['fromColors']['bg']

        requestAnimationFrame =>
          goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-enter-active"
          goog.style.setStyle @getDOMNode(), 'background-color', @props['toColors']['bg']
          window.setTimeout callback, 1000

    componentDidEnter: ->
      goog.dom.classes.remove @getDOMNode(), "#{@props['transition']}-enter", "#{@props['transition']}-enter-active"
      console.log 'componentDidEnter', @props['transition']

    componentWillLeave: (callback) ->
      console.log 'componentWillLeave', @props['transition']
      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-leave"

        requestAnimationFrame =>
          goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-leave-active"
          goog.style.setStyle @getDOMNode(), 'background-color', @props['fromColors']['bg']
          window.setTimeout callback, 1000

    componentDidLeave: () ->
      console.log 'componentDidLeave', @props['transition']
      goog.dom.classes.remove @getDOMNode(), "#{@props['transition']}-leave", "#{@props['transition']}-leave-active"

    render: ->
      console.log 'AAA', @props['transition']

      config =
        'className': classNames ['aa-page']
        'style':
          'backgroundColor': @props['toColors']['bg']
      React.DOM.div config, section #mozna neni potreba div, staci vratit tu sekci

