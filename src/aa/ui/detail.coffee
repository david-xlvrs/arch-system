goog.provide 'aa.ui.Detail'

goog.require 'aa.ui.DetailCounter'
goog.require 'aa.ui.DetailSlide'
goog.require 'goog.array'
goog.require 'goog.object'


aa.ui.Detail = React.createClass
  statics:
    IMG_WIDTH: 0.75
    IMG_HEIGHT: 0.65

  getDefaultProps: ->
    'project': {}
    'activeSlide': 0
    'moveNext': no
    'viewport':
      'width': 0
      'height': 0

  render: ->
    project = @props['project']
    activeSlide = @props['activeSlide']

    return null if goog.object.isEmpty project

    slides = project['slides']

    config =
      'className': classNames
        'aa-page': yes
        'aa-page-detail': yes
      'style':
        'color': slides[activeSlide]['colors']['content']
        'backgroundColor': slides[activeSlide]['colors']['bg']

    content = []

    content.push React.createElement aa.ui.DetailCounter,
        'key': 'detailCounter'
        'active': parseInt(activeSlide, 10) + 1
        'total': @props['project']['slides'].length
        'color': slides[activeSlide]['colors']['content']

    content.push React.createElement(React.addons.TransitionGroup, {
      'className': 'aa-detail', 'key': 'aa-detail-transition'},
        React.createElement aa.ui.transition.Basic,
          'section': aa.ui.DetailSlide
          'sectionProps': @props
          'key': 'key-selected-SLIDE' + activeSlide
          'transition': aa.Const.TRANSITION.DETAIL_2_DETAIL
    )

    React.DOM.div config, content

