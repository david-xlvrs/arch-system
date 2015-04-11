module.exports = (g, gsize, config) ->

  g.task 'index:create', ->
    gtemplate = require 'gulp-template'
    gconnect = require 'gulp-connect'

    if config.argv.production
      scripts = """
        <link href="css/style.min.css" type="text/css" rel="stylesheet" />
        <script src="js/app_all.min.js" type="text/javascript"></script>
      """
    else
      scripts = """
        <link href="css/style.css" type="text/css" rel="stylesheet" />
        <script src="_dev/vendor/vendor.js" type="text/javascript"></script>
        <script src="_dev/closure-library/closure/goog/base.js" type="text/javascript"></script>
        <script src="_dev/js/closure-deps.js" type="text/javascript"></script>
        <script type="text/javascript">goog.require('sandbox.Bootstrap');</script>
      """

    g.src(config.paths.index.template)
    .pipe(gtemplate {scripts})
    .pipe(gsize title: 'index:create')
    .pipe(g.dest config.paths.app.dst)
    .pipe(gconnect.reload())
