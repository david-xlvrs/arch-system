module.exports = (g, gsize, config) ->

  g.task 'soy:transpile', [], ->
    soy = require 'gulp-soy'
    gconnect = require 'gulp-connect'
    soyOptions =
      soyutils: yes
      flags: [
        '--shouldGenerateJsdoc'
        '--shouldProvideRequireSoyNamespaces'
      ]

    g.src(config.paths.soy.srcGlob)
    .pipe(soy soyOptions)
    .pipe(g.dest config.paths.soy.dst)
    .pipe(gconnect.reload())
