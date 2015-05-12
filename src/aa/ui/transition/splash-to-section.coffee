goog.provide 'aa.ui.transition.SplashToSection'

goog.require 'goog.style'


aa.ui.transition.SplashToSection = (section) ->
  React.createClass
    getDefaultProps: ->
      'fromColors': {}
      'toColors': {}
      'transition': ''

    componentWillEnter: (callback) ->
      console.log 'componentWillEnter'
      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-enter"
        goog.style.setStyle @getDOMNode(), 'background-color', @props['fromColors']['bg']

        requestAnimationFrame =>
          goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-enter-active"
          goog.style.setStyle @getDOMNode(), 'background-color', ''
          window.setTimeout callback, 1000

    componentDidEnter: ->
      goog.dom.classes.remove @getDOMNode(), "#{@props['transition']}-enter", "#{@props['transition']}-enter-active"
      console.log 'componentDidEnter'

    componentWillLeave: (callback) ->
      console.log 'componentWillLeave'
      goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-leave"

      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-leave-active"
        goog.style.setStyle @getDOMNode(), 'background-color', @props['fromColors']['bg']
        window.setTimeout callback, 1000

    render: ->
      config =
        'className': classNames ['aa-page']
        # 'style':
        #   'color': @props['colors']['content']
        #   'backgroundColor': @props['colors']['bg']
      React.DOM.div config, section

