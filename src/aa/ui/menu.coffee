goog.provide 'aa.ui.Menu'
goog.provide 'aa.ui.MenuItem'

aa.ui.Menu = React.createClass
  getDefaultProps: ->
    'active': null

  render: ->
    links = []

    #about
    links.push React.createElement aa.ui.MenuItem,
      'key': 'about'
      'title': 'About'
      'url': window.location.href + '#about'
      'className': 'aa-menu-about'

    #selected
    links.push React.createElement aa.ui.MenuItem,
      'key': 'selected'
      'title': 'Selected projects'
      'url': window.location.href + '#selected'
      'className': 'aa-menu-selected'

    #index
    links.push React.createElement aa.ui.MenuItem,
      'key': 'index'
      'title': 'Index'
      'url': window.location.href + '#index'
      'className': 'aa-menu-index'

    React.DOM.div 'className': 'aa-menu',
      React.DOM.ul null, links


aa.ui.MenuItem = React.createClass
  getDefaultProps: ->
    'title': ''
    'url': ''
    'active': no
    'display': yes
    'className': ''

  render: ->
    classes = [@props['className']]
    classes.push 'active' if @props['active']

    React.DOM.li 'className': classes,
      React.DOM.a 'href': @props['url'], @props['title']
