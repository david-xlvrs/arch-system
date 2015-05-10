goog.provide 'aa.ui.Detail'

goog.require 'goog.array'
goog.require 'goog.object'


aa.ui.Detail = React.createClass
  getDefaultProps: ->
    'project': {}
    'activeSlide': 0
    'moveNext': no

  render: ->
    project = @props['project']
    return null if goog.object.isEmpty project

    console.log 'kreslim DETAIL', @props['moveNext']

    slides = goog.array.clone project['slides']
    goog.array.insertAt slides, project, 0

    slideElements = []

    config =
      'key': 'project' + project['id']
      'className': 'aa-project-slide'

    slideElements.push React.DOM.div config, [
        React.DOM.img
          'key': 'projectImg' + slides[@props['activeSlide']]['id']
          'src': slides[@props['activeSlide']]['image']['url']
      ,
        React.DOM.h2 'key': 'projectTitle' + slides[@props['activeSlide']]['id'], slides[@props['activeSlide']]['title']
      ]

    if slides.length > 1
      slideElements.push React.DOM.div {
        'key': 'next-slide'
        'className': 'aa-project-slide aa-next-slide'
        'onClick': ->
      }, [
        React.DOM.img
          'key': 'projectImg' + slides[@props['activeSlide'] + 1]['id']
          'src': slides[@props['activeSlide'] + 1]['image']['url']
      ]

      slideElements.push React.DOM.div {
        'key': 'previous-slide'
        'className': 'aa-project-slide aa-previous-slide'
      }, [
        React.DOM.img
          'key': 'projectImg' + slides[slides.length - 1]['id']
          'src': slides[slides.length - 1]['image']['url']
      ]



    config =
      'className': classNames
        'aa-page': yes
        'aa-page-detail': yes
      'style':
        'color': slides[@props['activeSlide']]['colors']['content']
        'backgroundColor': slides[@props['activeSlide']]['colors']['bg']
    React.DOM.div config, [
      React.DOM.div 'key': 'detail-list', 'className': 'aa-detail-list', slideElements
      React.createElement aa.ui.Menu,
        'key': 'aa-content-menu'
        'colors': @props['project']?['colors']
      React.DOM.a
        'key': 'detail-closer'
        'className': 'aa-close'
        'href': '/#selected'
    ]

