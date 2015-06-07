goog.provide 'aa.ui.Application'

goog.require 'aa.ui.Splash'
goog.require 'aa.ui.Sections'
goog.require 'aa.ui.transition.Basic'

aa.ui.Application = React.createClass
  statics:
    SPLASH_DELTA_LIMIT: -20

  getDefaultProps: ->
    'section': aa.Const.SECTION.SPLASH
    'previousSection': aa.Const.SECTION.SELECTED
    'transition': aa.Const.TRANSITION.SPLASH_2_SECTION
    'viewport':
      'width': 0
      'height': 0
    'data': {}
    'styleConfig': {}
    'loaded': no

  render: ->
    React.createElement(React.addons.TransitionGroup, {
      'className': 'aa-application', 'key': 'aa-application-transition'
      'style':
        'backgroundColor': @props['styleConfig']['colors']['bg']
      },
        if @props['loaded'] and @props['section'] isnt aa.Const.SECTION.SPLASH
          React.createElement aa.ui.transition.Basic,
            'section': aa.ui.Sections
            'sectionProps':
              'key': 'section-sections'
              'styleConfig': @props['styleConfig']
              'section': @props['section']
              'previousSection': @props['previousSection']
              'data': @props['data']
              'viewport': @props['viewport']
              'loaded': @props['loaded']
              'handleScrollTo': @props['handleScrollTo']
            'key': 'key-sections-trans'
            'transition': aa.Const.TRANSITION.SPLASH_2_SECTION
            'fromColors': @props['data']['splash']['colors']
            'toColors': @props['styleConfig']['colors']
        else
          React.createElement aa.ui.transition.Basic,
            'section': aa.ui.Splash
            'sectionProps':
              'key': 'section-splash'
              'colors': @props['data']['splash']['colors']
              'title': @props['data']['splash']['title']
              'imageUrl': @props['data']['splash']['imageUrl']
              'loaded': @props['loaded']
            'key': 'key-splash-trans'
            'transition': aa.Const.TRANSITION.NONE
      )


aa.ui.application = {}
###*
  @param {Object} settings
  @param {Element} parentEl
###
aa.ui.application.render = (settings, parentEl) ->
  app = React.createElement aa.ui.Application, settings
  React.render app, parentEl
  return
