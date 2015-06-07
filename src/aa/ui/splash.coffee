goog.provide 'aa.ui.Splash'


aa.ui.Splash = React.createClass
  getDefaultProps: ->
    'colors': {}
    'imageUrl': ''
    'title': ''
    'loaded': no



  handleScroll: (e) ->
    e.preventDefault()
    e.stopPropagation()

    delta = Math.max( -1, Math.min(1, (e.wheelDelta or -e.detail)))

    @setState 'wheelDelta': 0 unless @state?['wheelDelta']
    @setState 'wheelDelta': @state?['wheelDelta'] += delta

    if @state['wheelDelta'] < aa.ui.Application.SPLASH_DELTA_LIMIT and @props['loaded']
      window.location.href = aa.Router.getRoute aa.Const.SECTION.SELECTED
      @componentWillUnmount()

  componentDidMount: ->
    window.addEventListener 'mousewheel', @handleScroll
    window.addEventListener 'DOMMouseScroll', @handleScroll

  componentWillUnmount: ->
    window.removeEventListener 'mousewheel', @handleScroll
    window.removeEventListener 'DOMMouseScroll', @handleScroll

  render: ->
    content = []

    content.push React.createElement(React.addons.CSSTransitionGroup, {
      'className': 'aa-splash-fade', 'transitionName': 'splash-loaded', 'key': 'splash-transition'},
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

    content.push React.createElement aa.ui.Menu,
      'key': 'aa-content-menu'
      'colors': @props['colors']


    config =
      'className': classNames ['aa-splash']
      'style':
        'backgroundImage': 'url(' + @props['imageUrl'] + ')'
    React.DOM.div config, content

