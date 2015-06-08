goog.provide 'aa.ui.IndexFilter'

goog.require 'aa.Const'

aa.ui.IndexFilter = React.createClass

  render: ->
    content = []

    console.log 'props', @props

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

      content.push React.DOM.div configDiv, React.DOM.a configA, param['name']

    console.log 'props', @props


    config =
      'key': 'index-table'
      'className': 'aa-index-filter'
      'style':
        'color': @props['colors']['bg']
        'backgroundColor': @props['colors']['content']
    React.DOM.div config, content

