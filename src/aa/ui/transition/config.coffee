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
