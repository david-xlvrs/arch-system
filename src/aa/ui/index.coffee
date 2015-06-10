goog.provide 'aa.ui.Index'

goog.require 'aa.ui.IndexFilter'
goog.require 'goog.json'
goog.require 'goog.object'

aa.ui.Index = React.createClass
  getDefaultProps: ->
    'projects': []

  getFilterSearch: ->
    try
      search = goog.json.parse @props['filter']['search']
    catch error
      search = {}
    search

  getFilterHref: (key, value) ->
    search = @getFilterSearch()

    if value
      search[key] = value
    else
      delete search[key] if search[key]

    newSearch = goog.json.serialize search
    aa.Router.getRoute aa.Const.SECTION.INDEX, @props['filter']['sortBy'], @props['filter']['sortWay'], newSearch

  render: ->
    content = []

    if @props['projects']?.length

      projects = []
      for project in @props['projects']
        projects.push goog.object.clone project

      # sorting
      sortBy = @props['filter']['sortBy']
      sortWay = @props['filter']['sortWay']
      goog.array.stableSort projects, (item1, item2) ->
        if item1[sortBy] > item2[sortBy]
          return if sortWay is 'asc' then 1 else -1
        if item1[sortBy] < item2[sortBy]
          return if sortWay is 'asc' then -1 else 1
        0

      #formating
      for project, iter in projects
        project['date'] = (new Date project['date']).getFullYear()

      # filtering
      unless goog.object.isEmpty search = @getFilterSearch()
        projects = goog.array.filter projects, (item, iter) ->
          for key, param of search
            if item[key] isnt param
              return no
          yes

      for project, iter in projects
        config =
          'key': 'projectTr' + project['id']
          'className': 'aa-project-row'

        year = project['date']

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
              React.DOM.a 'key': 'projectParam1' + iter, 'href': @getFilterHref('custom1', project['custom1']),
                project['custom1']
          ,
            React.DOM.td 'key': 'td' + iter + '4', 'className': 'col4',
              React.DOM.a 'key': 'projectParam2' + iter, 'href': @getFilterHref('custom2', project['custom2']),
                project['custom2']
          ,
            React.DOM.td 'key': 'td' + iter + '5', 'className': 'col5 aRight',
              React.DOM.a 'key': 'projectDate' + project['id'], 'href': @getFilterHref('date', year),
                year
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
        'search': @getFilterSearch()
      React.DOM.div 'key': 'index-table', 'className': 'aa-table', React.DOM.table null, React.DOM.tbody null, content
    ]

