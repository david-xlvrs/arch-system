goog.provide 'aa.ui.Selected'

goog.require 'goog.style'


aa.ui.Selected = React.createClass
  getDefaultProps: ->
    'projects': []
    'activeProject': 0
    'colors': {}

  render: ->
    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']

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
      'className': classNames ['aa-content', 'aa-content-selected']
    React.DOM.div config, content

