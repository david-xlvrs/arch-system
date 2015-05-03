goog.provide 'aa.ui.Splash'


aa.ui.Splash = React.createClass
  getDefaultProps: ->
    'colors': {}
    'imageUrl': ''
    'title': ''
    'loaded': no

  render: ->
    config =
      'className': classNames ['aa-page', 'aa-page-splash']
      'style':
        'backgroundImage': 'url(' + @props['imageUrl'] + ')'

    content = []

    unless @props['loaded']
      content.push React.createElement(React.addons.CSSTransitionGroup, {'className': 'aa-splash-fade', 'transitionName': "example"},
          React.DOM.div
            'key': 'splash-fade'
            'style':
              'backgroundColor': @props['colors']['bg']
        )

    content.push React.DOM.h1
      'key': 'splash-title'
      'style':
        'color': @props['colors']['content']
      ,
        @props['title']

    React.DOM.div config, content

