goog.provide 'aa.ui.Splash'


aa.ui.Splash = React.createClass
  getDefaultProps: ->
    'colors': {}
    'imageUrl': ''
    'title': ''
    'loaded': no

  render: ->
    content = []
    content.push React.createElement(React.addons.CSSTransitionGroup, {
      'className': 'aa-splash-fade', 'transitionName': 'example', 'key': 'splash-transition'},
        unless @props['loaded']
          React.DOM.div
            'key': 'splash-fade'
            'style':
              'backgroundColor': @props['colors']['bg']
        else
          null
      )

    content.push React.DOM.h1
      'key': 'splash-title'
      'style':
        'color': @props['colors']['content']
      ,
        @props['title']

    config =
      'className': classNames ['aa-page', 'aa-page-splash']
      'style':
        'backgroundImage': 'url(' + @props['imageUrl'] + ')'
    React.DOM.div config, content

