goog.provide 'aa.ui.Detail'

goog.require 'goog.object'


aa.ui.Detail = React.createClass
  getDefaultProps: ->
    'project': {}
    'activeProject': 0

  render: ->
    project = @props['project']
    return null if goog.object.isEmpty project

    content = []

    config =
      'key': 'project' + project['id']
      'className': 'aa-project-slide'
      'style':
        'color': project['colors']['content']
        'backgroundColor': project['colors']['bg']

    content.push React.DOM.div config, [
        React.DOM.img
          'key': 'projectImg' + project['id']
          'src': project['image']['url']
      ,
        React.DOM.h2 'key': 'projectTitle' + project['id'], project['title']
      ]

    content.push React.DOM.a
      'key': 'detail-closer'
      'className': 'aa-close'
      'href': '/#selected'

    config =
      'className': classNames ['aa-page', 'aa-page-detail']
    React.DOM.div config, content

