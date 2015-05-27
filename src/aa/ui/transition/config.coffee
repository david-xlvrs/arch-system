goog.provide 'aa.ui.transition.Config'

goog.require 'goog.style'
goog.require 'aa.Const'

aa.ui.transition.Config = {}

aa.ui.transition.Config[aa.Const.TRANSITION.SPLASH_2_SECTION] =
  'duration': aa.Const.ANIMATION.DURATION * 2
  'enter': (component) ->
    goog.style.setStyle component.getDOMNode(), 'background-color', component.props['fromColors']['bg']
  'enter-active': (component) ->
    goog.style.setStyle component.getDOMNode(), 'background-color', component.props['toColors']['bg']
  'leave-active': (component) ->
    goog.style.setStyle component.getDOMNode(), 'background-color', component.props['fromColors']['bg']

aa.ui.transition.Config[aa.Const.TRANSITION.SECTION_2_SECTION] =
  'duration': aa.Const.ANIMATION.DURATION

aa.ui.transition.Config[aa.Const.TRANSITION.DETAIL_2_DETAIL] =
  'duration': aa.Const.ANIMATION.DURATION * 2
  'leave-active': (component) ->
    if previous = goog.dom.getElementByClass 'aa-previous-slide',  component.getDOMNode()
      previousImg = goog.dom.getChildren(previous)[0]
      x =  goog.style.getSize(previousImg).width / 2 - aa.Const.CSS.SIZE1
      goog.style.setStyle previous, 'transform', "translate3d(-#{x}px, 0, 0)"

    if act = goog.dom.getElementByClass 'aa-actual-slide',  component.getDOMNode()
      x = 1425 / 2 + goog.style.getSize(act).width / 2 - aa.Const.CSS.SIZE1
      goog.style.setStyle act, 'transform', "translate3d(-#{x}px, 0, 0)"

    if next = goog.dom.getElementByClass 'aa-next-slide',  component.getDOMNode()
      nextImg = goog.dom.getChildren(next)[0]
      x = 1425 / 2 + goog.style.getSize(nextImg).width / 2 - aa.Const.CSS.SIZE1
      goog.style.setStyle next, 'transform', "translate3d(-#{x}px, 0, 0)"
