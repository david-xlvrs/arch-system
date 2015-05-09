goog.provide 'aa.ui.Application'

goog.require 'aa.ui.Splash'
goog.require 'aa.ui.Selected'
goog.require 'aa.ui.Index'
goog.require 'aa.ui.Detail'
goog.require 'aa.ui.Menu'

aa.ui.Application = React.createClass
  statics:
    SECTION_SPLASH: 'section-splash'
    SECTION_SELECTED: 'section-selected'
    SECTION_INDEX: 'section-index'
    SECTION_PRIVATE: 'section-private'
    SECTION_ABOUT: 'section-about'
    SECTION_DETAIL: 'section-detail'
    TRANSITION_SPLASH_2_SECTION: 'splash-to-section'
    TRANSITION_SECTION_2_SECTION: 'section-to-section'
    TRANSITION_SELECTED_2_DETAIL: 'selected-to-detail'
    TRANSITION_DETAIL_2_SELECTED: 'detail-to-selected'
    TRANSITION_DETAIL_2_SECTION: 'detail-to-section'

  getDefaultProps: ->
    #TODO
    'section': aa.ui.Application.SECTION_SPLASH
    'transition': aa.ui.Application.TRANSITION_SPLASH_2_SECTION
    'data': {}
    'loaded': no

  render: ->
    content = []

    console.log 'trans', @props['transition']

    content.push React.createElement(React.addons.CSSTransitionGroup, {
      'className': 'aa-content', 'transitionName': @props['transition'], 'key': 'aa-content-transition'},
        switch @props['section']
          when aa.ui.Application.SECTION_INDEX
            React.createElement aa.ui.Index,
              'key': 'section-all'
              'projects': @props['data']['all']
          when aa.ui.Application.SECTION_SELECTED
            React.createElement aa.ui.Selected,
              'key': 'section-selected'
              'projects': @props['data']['selected']
          when aa.ui.Application.SECTION_DETAIL
            React.createElement aa.ui.Detail,
              'key': 'section-detail'
              'project': @props['data']['detail']
          else
            null
      )


    React.DOM.div 'className': 'aa-application', [
        React.createElement aa.ui.Splash,
          'key': 'section-splash'
          'colors': @props['data']['splash']['colors']
          'title': @props['data']['splash']['title']
          'imageUrl': @props['data']['splash']['imageUrl']
          'loaded': @props['loaded']
      ,
        React.createElement aa.ui.Menu,
          'key': 'aa-menu'
          'colors': @props['data']['selected']?[0]['colors']
      ,
        content
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
