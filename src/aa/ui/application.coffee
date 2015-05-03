goog.provide 'aa.ui.Application'

goog.require 'aa.ui.Splash'
goog.require 'aa.ui.Menu'

aa.ui.Application = React.createClass
  statics:
    SECTION_SPLASH: 'section-splash'
    SECTION_SELECTED: 'section-selected'
    SECTION_INDEX: 'section-index'
    SECTION_PRIVATE: 'section-private'
    SECTION_ABOUT: 'section-about'

  getDefaultProps: ->
    #TODO
    'section': aa.ui.Application.SECTION_SPLASH
    'data': {}
    'loaded': no

  render: ->
    switch @props['section']
      when aa.ui.Application.SECTION_SPLASH
        content = React.createElement aa.ui.Splash,
          'key': 'section-splash'
          'colors': @props['data']['splash']['colors']
          'title': @props['data']['splash']['title']
          'imageUrl': @props['data']['splash']['imageUrl']
          'loaded': @props['loaded']

    React.DOM.div 'className': 'aa-application', [
        content
      ,
        React.createElement aa.ui.Menu,
          'key': 'aa-menu'
    ]


aa.ui.application = {}
###*
  @param {Object} settings
  @param {Element} parentEl
###
aa.ui.application.render = (settings, parentEl) ->
  app = React.createElement aa.ui.Application, settings
  React.render app, parentEl
  return
