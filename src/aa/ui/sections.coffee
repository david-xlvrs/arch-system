goog.provide 'aa.ui.Sections'

goog.require 'aa.ui.Selected'
goog.require 'aa.ui.Index'
goog.require 'aa.ui.Detail'
goog.require 'aa.ui.Menu'
goog.require 'aa.ui.transition.Basic'

aa.ui.Sections = React.createClass

  handleScroll: (e) ->
    e.preventDefault()
    e.stopPropagation()

  componentWillMount: ->
    window.addEventListener 'mousewheel', @handleScroll
    window.addEventListener 'DOMMouseScroll', @handleScroll

    window.setTimeout (=>
      @componentWillUnmount()
    ), aa.ui.transition.Config[aa.Const.TRANSITION.SPLASH_2_SECTION]['duration']

  componentWillUnmount: ->
    window.removeEventListener 'mousewheel', @handleScroll
    window.removeEventListener 'DOMMouseScroll', @handleScroll

  render: ->
    React.createElement(React.addons.TransitionGroup, {
      'className': 'aa-section', 'key': 'aa-section-transition'
      'style':
        'backgroundColor': @props['styleConfig']['colors']['bg']
      },
        switch @props['section']
          when aa.Const.SECTION.INDEX
            React.createElement aa.ui.transition.Basic,
              'section': aa.ui.Index,
              'sectionProps':
                'key': 'section-all'
                'projects': @props['data']['all']
              'key': 'key-index-trans'
              'transition': aa.Const.TRANSITION.SECTION_2_SECTION
          when aa.Const.SECTION.DETAIL
            React.createElement aa.ui.transition.Basic,
              'section': aa.ui.Detail
              'sectionProps':
                'key': 'section-detail'
                'project': @props['data']['detail']
                'activeSlide': @props['data']['detailSlide']
                'viewport': @props['viewport']
              'key': 'key-detail-trans'
              'transition': aa.Const.TRANSITION.SECTION_2_SECTION
          else
            React.createElement aa.ui.transition.Basic,
              'section': aa.ui.Selected
              'sectionProps':
                'key': 'section-selected'
                'viewport': @props['viewport']
                'projects': @props['data']['selected']
                'colors': @props['styleConfig']['colors']
                'handleScrollTo': @props['handleScrollTo']
              'key': 'key-selected-trans'
              'transition': aa.Const.TRANSITION.SECTION_2_SECTION
      )
