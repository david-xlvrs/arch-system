goog.provide 'aa.ui.Application'

goog.require 'aa.ui.Splash'
goog.require 'aa.ui.Selected'
goog.require 'aa.ui.Index'
goog.require 'aa.ui.Detail'
goog.require 'aa.ui.Menu'
goog.require 'aa.ui.transition.Basic'

aa.ui.Application = React.createClass
  getDefaultProps: ->
    #TODO
    'section': aa.Const.SECTION.SPLASH
    'transition': aa.Const.TRANSITION.SPLASH_2_SECTION
    'viewport':
      'width': 0
      'height': 0
    'data': {}
    'styleConfig': {}
    'loaded': no

  render: ->
    content = []

    content.push React.createElement(React.addons.TransitionGroup, {
      'className': 'aa-section', 'key': 'aa-section-transition'},
        switch @props['section']
          when aa.Const.SECTION.INDEX
            index = React.createElement aa.ui.Index,
              'key': 'section-all'
              'projects': @props['data']['all']
            React.createElement aa.ui.transition.Basic(index),
              'key': 'key-index-' + @props['transition']
              'transition': @props['transition']
              'fromColors': @props['data']['splash']['colors']
              'toColors': @props['styleConfig']['colors']
          when aa.Const.SECTION.SELECTED
            selected = React.createElement aa.ui.Selected,
              'key': 'section-selected'
              'viewport': @props['viewport']
              'projects': @props['data']['selected']
              'colors': @props['styleConfig']['colors']
            React.createElement aa.ui.transition.Basic(selected),
              'key': 'key-selected-' + @props['transition']
              'transition': @props['transition']
              'fromColors': @props['data']['splash']['colors']
              'toColors': @props['styleConfig']['colors']
          when aa.Const.SECTION.DETAIL
            detail = React.createElement aa.ui.Detail,
              'key': 'section-detail'
              'project': @props['data']['detail']
              'activeSlide': @props['data']['detailSlide']
              'viewport': @props['viewport']
            React.createElement aa.ui.transition.Basic(detail),
              'key': 'key-detail-' + @props['transition']# + @props['data']['detailSlide']
              'transition': @props['transition']
              'fromColors': @props['data']['splash']['colors']
              'toColors': @props['styleConfig']['colors']
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
          'colors': @props['data']['splash']['colors']
      ,
        content
      # ,
      #   React.createElement aa.ui.Detail,
      #     'key': 'section-detail22'
      #     'project': @props['data']['detail']
      #     'activeSlide': @props['data']['detailSlide']
      #     'viewport': @props['viewport']
      ,
        React.DOM.div 'key': 'TEMP1', 'className': 'TEMP', ''
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
