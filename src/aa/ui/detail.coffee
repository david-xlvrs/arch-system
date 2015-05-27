goog.provide 'aa.ui.Detail'

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
    React.DOM.div config, React.createElement aa.ui.DetailSlide, @props

