module.exports = (g, gsize, config) ->

  g.task 'index:create', ->
    gtemplate = require 'gulp-template'
    gconnect = require 'gulp-connect'

    if config.argv.production
      scripts = """
        <script src="js/script.min.js" type="text/javascript"></script>
        <link href="css/style.min.css" type="text/css" rel="stylesheet" />
      """
    else
      scripts = """
        <script src="closure/closure/goog/base.js" type="text/javascript"></script>
        <script src="js/closure-deps.js" type="text/javascript"></script>
        <script type="text/javascript">goog.require('sandbox.Bootstrap');</script>
        <link href="css/style.css" type="text/css" rel="stylesheet" />
      """

    g.src(config.paths.index.srcGlob)
    .pipe(gtemplate {scripts})
    .pipe(gsize title: 'index:create')
    .pipe(g.dest config.paths.app.dst)
    .pipe(gconnect.reload())
