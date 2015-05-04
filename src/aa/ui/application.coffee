goog.provide 'aa.ui.Application'

goog.require 'aa.ui.Splash'
goog.require 'aa.ui.Selected'
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
    content = []
    content.push React.createElement aa.ui.Splash,
      'key': 'section-splash'
      'colors': @props['data']['splash']['colors']
      'title': @props['data']['splash']['title']
      'imageUrl': @props['data']['splash']['imageUrl']
      'loaded': @props['loaded']


    content.push React.createElement(React.addons.CSSTransitionGroup, {
      'className': 'aa-neco', 'transitionName': 'selected-start', 'key': 'selected-start-transition'},
        switch @props['section']
          when aa.ui.Application.SECTION_SELECTED
            React.createElement aa.ui.Selected,
              'key': 'section-selected'
              'projects': @props['data']['selected']
          else
            null
      )


    React.DOM.div 'className': 'aa-application', [
        content
      ,
        React.createElement aa.ui.Menu,
          'key': 'aa-menu'
          'expanded': @props['section'] isnt aa.ui.Application.SECTION_SPLASH
          'colors': @props['data']['selected']?[0]['colors']
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
