goog.provide 'aa.ui.Selected'

goog.require 'goog.style'


aa.ui.Selected = React.createClass
  getDefaultProps: ->
    'projects': []
    'activeProject': 0
    'colors': {}
    'fromColors': {}
    'transition': ''

  componentWillEnter: (callback) ->
    console.log 'componentWillEnter'
    requestAnimationFrame =>
      goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-enter"
      goog.style.setStyle @getDOMNode(), 'background-color', @props['fromColors']['bg']

      requestAnimationFrame =>
        goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-enter-active"
        goog.style.setStyle @getDOMNode(), 'background-color', ''
        window.setTimeout callback, 1000

  componentDidEnter: ->
    goog.dom.classes.remove @getDOMNode(), "#{@props['transition']}-enter", "#{@props['transition']}-enter-active"
    console.log 'componentDidEnter'

  componentWillLeave: (callback) ->
    console.log 'componentWillLeave'
    goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-leave"

    requestAnimationFrame =>
      goog.dom.classes.add @getDOMNode(), "#{@props['transition']}-leave-active"
      goog.style.setStyle @getDOMNode(), 'background-color', @props['fromColors']['bg']
      window.setTimeout callback, 1000

  render: ->
    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']

    console.log 'XX', @props['colors']

    if @props['projects']?.length
      for project in @props['projects']
        config =
          'key': 'project' + project['id']
          'className': 'aa-project-slide'

        content.push React.DOM.div config, React.DOM.a 'href': '/#selected/' + project['id'] + '/0', [
            React.DOM.img
              'key': 'projectImg' + project['id']
              'src': project['image']['url']
          ,
            React.DOM.h2 'key': 'projectTitle' + project['id'], project['title']
          ]

    config =
      'className': classNames ['aa-page', 'aa-page-selected']
      'style':
        'color': @props['colors']['content']
        'backgroundColor': @props['colors']['bg']
    React.DOM.div config, content

