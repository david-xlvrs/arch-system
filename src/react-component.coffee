goog.provide 'sandbox.ReactComponent'

sandbox.ReactComponent = React.createClass (`/** @lends {React.ReactComponent.prototype} */`)
  getDefaultProps: ->
    'title': ''

  render: ->
    React.DOM.div {'className': classNames
      'cool': yes
      'not-cool': no
    }, @props['title']
