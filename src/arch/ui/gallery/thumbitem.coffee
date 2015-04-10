goog.provide 'arch.ui.gallery.ThumbItem'

goog.require 'react'


arch.ui.gallery.ThumbItem = React.createClass
  getDefaultProps: ->
    'title': ''
    'thumbUrl': ''
    'classes': []
    'active': no
    'display': yes
    'onClick': ->

  render: ->
    styles = @props['classes'][..]  #TODO: vyresime pres classnames
    styles.push 'active' if @props['active']
    styles.push 'arch-hide' unless @props['display']

    content = [
      React.DOM.strong null, @props['title']
    ]
    content.push React.DOM.img 'src': @props['thumbUrl'] if @props['thumbUrl']

    React.DOM.li
      'className': styles.join ' '
      'onClick': @props['onClick']
    , content
