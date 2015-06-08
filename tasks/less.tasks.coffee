module.exports = (g, gsize, config) ->

  g.task 'less:transpile', [], ->
    gfilter = require 'gulp-filter'
    gless = require 'gulp-less'
    path = require 'path'
    sprite = require('css-sprite').stream
    gconnect = require 'gulp-connect'
    grename = require 'gulp-rename'

    filterImagesForSprite = gfilter '*.png'
    filterSpriteImage = gfilter config.paths.sprites.namePng
    filterLess = gfilter '**/*.less'
    filterMainLess = gfilter config.paths.less.mainGlob

    stream = g.src([config.paths.sprites.srcGlob, config.paths.less.srcGlob])
      .pipe(filterImagesForSprite)
      .pipe(sprite
        template: config.paths.sprites.template
        name: config.paths.sprites.namePng
        style: config.paths.sprites.nameLess
        cssPath: '@{base-sprite-url}'
        processor: 'less'
        prefix: 'sprite-icons'
        orientation: 'binary-tree'
        margin: 0
      )
      .pipe(gsize title: 'sprites:generate')
      .pipe(filterSpriteImage)

    if config.argv.production
      gimagemin = require 'gulp-imagemin'
      stream = stream.pipe(gimagemin
        progressive: yes
      )

    stream = stream.pipe(g.dest config.paths.img.dst)
      .pipe(filterSpriteImage.restore())
      .pipe(filterImagesForSprite.restore())
      .pipe(filterLess)

    if config.argv.sourcemaps
      gsourcemaps = require 'gulp-sourcemaps'
      stream = stream.pipe(gsourcemaps.init loadMaps: yes)

    stream = stream.pipe(gsize title: 'less:transpile source')
      .pipe(filterMainLess)
      .pipe(gless())
      .pipe(grename config.paths.less.nameCSS)

    if config.argv.production
      gminify = require 'gulp-minify-css'
      stream = stream.pipe(gminify())
        .pipe(grename config.paths.less.nameCSSMinified)

    stream = stream.pipe(gsize title: 'less:transpile output')

    if config.argv.sourcemaps
      stream = stream.pipe(gsourcemaps.write path.relative config.paths.less.dst, config.paths.less.mapDst)

    stream.pipe(g.dest config.paths.less.dst)
    .pipe(gconnect.reload())
