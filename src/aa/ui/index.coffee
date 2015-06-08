goog.provide 'aa.ui.Index'

goog.require 'aa.ui.IndexFilter'

aa.ui.Index = React.createClass
  getDefaultProps: ->
    'projects': []

  render: ->
    content = []

    if @props['projects']?.length

      projects = goog.array.clone @props['projects']

      sortBy = @props['filter']['sortBy']
      sortWay = @props['filter']['sortWay']
      ret = goog.array.stableSort projects, (item1, item2) ->
        if item1[sortBy] > item2[sortBy]
          return if sortWay is 'asc' then 1 else -1
        if item1[sortBy] < item2[sortBy]
          return if sortWay is 'asc' then -1 else 1
        0

      for project, iter in projects
        config =
          'key': 'projectTr' + project['id']
          'className': 'aa-project-row'

        year = (new Date project['date']).getFullYear()

        content.push React.DOM.tr config, [
            React.DOM.td 'key': 'td' + iter + '1', 'className': 'col1',
              React.DOM.a 'href': aa.Router.getRoute(aa.Const.SECTION.DETAIL, project['slug'], 0),
                React.DOM.img
                  'key': 'projectImg' + iter
                  'src': project['image']['url']
          ,
            React.DOM.td 'key': 'td' + iter + '2', 'className': 'col2',
              React.DOM.a 'href': aa.Router.getRoute(aa.Const.SECTION.DETAIL, project['slug'], 0),
                React.DOM.strong 'key': 'projectTitle' + iter, project['title']
          ,
            React.DOM.td 'key': 'td' + iter + '3', 'className': 'col3',
              React.DOM.span 'key': 'projectParam1' + iter, project['custom1']
          ,
            React.DOM.td 'key': 'td' + iter + '4', 'className': 'col4',
              React.DOM.span 'key': 'projectParam2' + iter, project['custom2']
          ,
            React.DOM.td 'key': 'td' + iter + '5', 'className': 'col5 aRight',
              React.DOM.span 'key': 'projectDate' + project['id'], year
          ]

    menu = React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']

    config =
      'className': classNames ['aa-content', 'aa-content-index']
    React.DOM.div config, [
      menu,
      React.createElement aa.ui.IndexFilter,
        'key': 'index-filter'
        'colors': @props['colors']
        'params': @props['filter']['params']
        'sortBy': @props['filter']['sortBy']
        'sortWay': @props['filter']['sortWay']
      React.DOM.div 'key': 'index-table', 'className': 'aa-table', React.DOM.table null, React.DOM.tbody null, content
    ]

