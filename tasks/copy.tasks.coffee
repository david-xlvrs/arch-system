module.exports = (g, gsize, config) ->

  gchanged = require 'gulp-changed'
  gsymlink = require 'gulp-sym'

  g.task 'copy:closure', [], ->
    g.src(config.paths.closure.src)
    .pipe(gsymlink config.paths.closure.dst, force: yes, relative: yes)

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

  g.task 'copy:all', ['copy:closure', 'copy:img', 'copy:static']
