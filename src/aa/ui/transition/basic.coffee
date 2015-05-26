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

    getRealLeaveTransition: (transition) ->
      if transition is aa.Const.TRANSITION.SPLASH_2_SECTION and window.newTransition isnt aa.Const.TRANSITION.SPLASH_2_SECTION
        aa.Const.TRANSITION.SECTION_2_SECTION
      else if transition is aa.Const.TRANSITION.SECTION_2_SECTION and window.newTransition is aa.Const.TRANSITION.DETAIL_2_DETAIL
        window.newTransition
      else if transition is aa.Const.TRANSITION.DETAIL_2_DETAIL and window.newTransition is aa.Const.TRANSITION.SECTION_2_SECTION
        window.newTransition
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

          if previous = goog.dom.getElementByClass 'aa-previous-slide',  @getDOMNode()
            previousImg = goog.dom.getChildren(previous)[0]
            x = 1425 / 2 + goog.style.getSize(previousImg).width / 2 - aa.Const.CSS.SIZE1
            goog.style.setStyle previous, 'transform', "translate3d(-#{x}px, 0, 0)"

          if act = goog.dom.getElementByClass 'aa-actual-slide',  @getDOMNode()
            x = 1425 / 2 + goog.style.getSize(act).width / 2 - aa.Const.CSS.SIZE1
            goog.style.setStyle act, 'transform', "translate3d(-#{x}px, 0, 0)"

          if next = goog.dom.getElementByClass 'aa-next-slide',  @getDOMNode()
            nextImg = goog.dom.getChildren(next)[0]
            x = 1425 / 2 + goog.style.getSize(nextImg).width / 2 - aa.Const.CSS.SIZE1
            goog.style.setStyle next, 'transform', "translate3d(-#{x}px, 0, 0)"

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
      React.DOM.div config, section #mozna neni potreba div, staci vratit tu sekci
