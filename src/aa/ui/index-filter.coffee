goog.provide 'aa.ui.IndexFilter'

goog.require 'aa.Const'
goog.require 'goog.object'

aa.ui.IndexFilter = React.createClass

  getFilterHref: (key) ->
    search = goog.object.clone @props['search']

    delete search[key] if search[key]

    newSearch = if goog.object.isEmpty(search) then '' else goog.json.serialize search
    aa.Router.getRoute aa.Const.SECTION.INDEX, @props['sortBy'], @props['sortWay'], newSearch

  render: ->
    content = []
    sortingParts = []
    searchParts = []

    for param, iter in @props['params']
      configDiv =
        'key': 'filter-part-' + param['key']
        'className': classNames ['col' + (iter + 1), 'aa-filter-part', 'aa-filter-part-' + param['key']]
      configA =
        'key': 'filter-part-a-' + param['key']

      if param['key'] is @props['sortBy']
        newSortWay = if @props['sortWay'] is 'asc' then 'desc' else 'asc'
        configA['href'] = aa.Router.getRoute aa.Const.SECTION.INDEX, param['key'], newSortWay
        configA['className'] = @props['sortWay'] + ' to-' + newSortWay
      else
        configA['href'] = aa.Router.getRoute aa.Const.SECTION.INDEX, param['key'], 'asc'
        configA['className'] = 'to-asc'

      sortingParts.push React.DOM.div configDiv, React.DOM.a configA, param['name']

      configDiv['key'] += 'search'
      configA['key'] += 'search'
      configA['href'] = @getFilterHref param['key']

      a = if @props['search'][param['key']]
        React.DOM.a configA, @props['search'][param['key']]
      else
        null

      searchParts.push React.DOM.div configDiv, a

    content.push React.DOM.div 'key': 'filter-part-sorting', 'className': 'aa-filter-sorting', sortingParts

    unless goog.object.isEmpty @props['search']
      search = React.DOM.div 'key': 'filter-part-search', 'className': 'aa-filter-search', searchParts
      content.push search

    config =
      'key': 'index-table'
      'className': classNames
        'aa-index-filter': yes
        'aa-with-search': not goog.object.isEmpty @props['search']
      'style':
        'color': @props['colors']['bg']
        'backgroundColor': @props['colors']['content']
    React.DOM.div config, content

