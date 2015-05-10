goog.provide 'aa.ui.Selected'


aa.ui.Selected = React.createClass
  getDefaultProps: ->
    'projects': []
    'activeProject': 0

  render: ->
    content = []
    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['projects']?[0]['colors']

    if @props['projects']?.length
      for project in @props['projects']
        config =
          'key': 'project' + project['id']
          'className': 'aa-project-slide'
          'style':
            'color': project['colors']['content']
            'backgroundColor': project['colors']['bg']

        content.push React.DOM.div config, React.DOM.a 'href': '/#selected/' + project['id'] + '/0', [
            React.DOM.img
              'key': 'projectImg' + project['id']
              'src': project['image']['url']
          ,
            React.DOM.h2 'key': 'projectTitle' + project['id'], project['title']
          ]

    config =
      'className': classNames ['aa-page', 'aa-page-selected']
    React.DOM.div config, content

