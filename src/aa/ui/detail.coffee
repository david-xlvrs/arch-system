goog.provide 'aa.ui.Detail'

goog.require 'aa.Router'
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
      'key': 'aa-detail-transition'
      'style':
        'color': slides[activeSlide]['colors']['content']
        #'backgroundColor': '#000' #slides[activeSlide]['colors']['bg']

    content = []

    #0-background
    divConfig =
      'key': 'background'
      'className': 'aa-background-color'
      'style':
        'backgroundColor': slides[activeSlide]['colors']['bg']
    content.push React.DOM.div divConfig, ''

    content.push React.createElement React.addons.TransitionGroup, config,
        React.createElement aa.ui.transition.Basic,
          'section': aa.ui.DetailSlide
          'sectionProps': @props
          'key': 'key-selected-SLIDE' + activeSlide
          'transition': aa.Const.TRANSITION.DETAIL_2_NEXT

    React.DOM.div 'className': classNames(['aa-content', 'aa-content-detail']), content
