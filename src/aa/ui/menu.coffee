goog.provide 'aa.ui.Menu'
goog.provide 'aa.ui.MenuItem'

aa.ui.Menu = React.createClass
  getDefaultProps: ->
    'colors': {}

  render: ->
    links = []

    urlwithoutHash = window.location.href.split('#')[0]

    #about
    if not @props['justOne'] or @props['justOne'] is 'about'
      links.push React.createElement aa.ui.MenuItem,
        'key': 'about'
        'title': 'About us'
        'isActive': @props['active'] is 'about'
        'url': urlwithoutHash + '#about'
        'className': 'aa-menu-about'

    #selected
    if not @props['justOne'] or @props['justOne'] is 'selected'
      links.push React.createElement aa.ui.MenuItem,
        'key': 'selected'
        'title': 'Selected projects'
        'isActive': @props['active'] is 'selected'
        'url': urlwithoutHash + '#selected'
        'className': 'aa-menu-selected'

    #index
    if not @props['justOne'] or @props['justOne'] is 'index'
      links.push React.createElement aa.ui.MenuItem,
        'key': 'index'
        'title': 'Index'
        'isActive': @props['active'] is 'index'
        'url': urlwithoutHash + '#index'
        'className': 'aa-menu-index'

    config =
      'className': classNames
        'aa-menu': yes
        'aa-just-one': !!@props['justOne']
      'style':
        'color': @props['colors']['content']
        'backgroundColor': @props['colors']['bg']

    React.DOM.div config,
      React.DOM.ul null, links


aa.ui.MenuItem = React.createClass
  getDefaultProps: ->
    'title': ''
    'url': ''
    'isActive': no
    'display': yes
    'className': ''

  render: ->
    aConfig =
      'href': @props['url']
    aConfig['className'] = 'active' if @props['isActive']

    React.DOM.li 'className': @props['className'],
      React.DOM.a aConfig, @props['title']
