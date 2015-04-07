goog.require 'react'

goog.provide 'sandbox.ReactComponent'

sandbox.ReactComponent = React.createClass
  getDefaultProps: ->
    'title': ''

  render: ->
    React.DOM.div {}, @props['title']
