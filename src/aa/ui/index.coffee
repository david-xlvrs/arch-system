goog.provide 'aa.ui.Index'


aa.ui.Index = React.createClass
  getDefaultProps: ->
    'projects': []

  render: ->
    content = []

    if @props['projects']?.length
      for project in @props['projects']
        config =
          'key': 'projectTr' + project['id']
          'className': 'aa-project-row'

        year = (new Date project['date']).getFullYear()

        content.push React.DOM.tr config, [
            React.DOM.td 'key': 'td' + project['id'] + '1',
              React.DOM.a 'href': aa.Router.getRoute(aa.Const.SECTION.DETAIL, project['slug'], 0),
                React.DOM.img
                  'key': 'projectImg' + project['id']
                  'src': project['image']['url']
          ,
            React.DOM.td 'key': 'td' + project['id'] + '2',
              React.DOM.a 'href': aa.Router.getRoute(aa.Const.SECTION.DETAIL, project['slug'], 0),
                React.DOM.strong 'key': 'projectTitle' + project['id'], project['title']
          ,
            React.DOM.td 'key': 'td' + project['id'] + '3',
              React.DOM.span 'key': 'projectParam1' + project['id'], project['params'][0]['value']
          ,
            React.DOM.td 'key': 'td' + project['id'] + '4',
              React.DOM.span 'key': 'projectParam2' + project['id'], project['params'][1]['value']
          ,
            React.DOM.td 'key': 'td' + project['id'] + '5',
              React.DOM.span 'key': 'projectDate' + project['id'], year
          ]

    menu = React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']

    config =
      'className': classNames ['aa-content', 'aa-content-index']
    React.DOM.div config, [
      menu
      React.DOM.div 'key': 'asdj2e08', 'className': 'aa-table', React.DOM.table null, content
    ]

