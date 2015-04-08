module.exports = (g, gsize, config) ->

  gchanged = require 'gulp-changed'
  ginsert = require 'gulp-insert'

  g.task 'copy:closure', [], ->
    g.src(config.paths.closure.srcGlob)
    .pipe(gchanged config.paths.closure.dst)
    .pipe(gsize title: 'copy:closure')
    .pipe(g.dest config.paths.closure.dst)

  g.task 'copy:img', [], ->
    stream = g.src(config.paths.img.srcGlob)
      .pipe(gchanged config.paths.img.dst)

    if config.argv.production
      gimagemin = require 'gulp-imagemin'
      stream = stream.pipe(gimagemin
        progressive: yes
      )

    stream.pipe(gsize title: 'copy:img')
      .pipe(g.dest config.paths.img.dst)

  g.task 'copy:static', [], ->
    g.src(config.paths.static.srcGlob)
    .pipe(gchanged config.paths.app.dst)
    .pipe(gsize title: 'copy:static')
    .pipe(g.dest config.paths.app.dst)

  g.task 'copy:react', [], ->
    g.src(config.paths.react.src)
    .pipe(gchanged config.paths.react.dst)
    .pipe(ginsert.prepend "goog.provide('react');\n\n")
    .pipe(gsize title: 'copy:react')
    .pipe(g.dest config.paths.react.dst)

  g.task 'copy:all', ['copy:closure', 'copy:img', 'copy:static', 'copy:react']
