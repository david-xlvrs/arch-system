module.exports = (g, gsize, config) ->
  path = require 'path'
  gconcat = require 'gulp-concat'
  gconnect = require 'gulp-connect'
  gchanged = require 'gulp-changed'

  g.task 'coffee:transpile', [], ->
    gcoffee = require 'gulp-coffee'
    gcoffee2closure = require 'gulp-coffee2closure'

    g.src(config.paths.coffee.srcGlob)
    .pipe(gchanged config.paths.js.devDst, extension: '.js')
    .pipe(gsize title: 'coffee:transpile source')
    .pipe(gcoffee bare: yes)
    .pipe(gcoffee2closure())
    .pipe(gsize title: 'coffee:transpile output')
    .pipe(g.dest config.paths.js.devDst)

  g.task 'js:all', if config.argv.production then ['js:build'] else ['js:vendor', 'js:deps']

  g.task 'js:build', ['js:vendor', 'js:compile'], ->
    g.src([
      path.join config.paths.vendor.dst, config.paths.vendor.concatName
      path.join config.paths.js.devBuildDst, config.paths.js.nameMinified
    ])
    .pipe(gconcat config.paths.js.nameConcatenatedMinified)
    .pipe(gsize title: 'js:build')
    .pipe(g.dest config.paths.js.dst)
    .pipe(gconnect.reload())

  g.task 'js:vendor', [], ->
    guglify = require 'gulp-uglify'

    g.src(config.paths.vendor.srcGlob)
    .pipe(gchanged config.paths.vendor.dst)
    .pipe(gsize title: 'js:vendor source')
    .pipe(guglify compress: no)
    .pipe(gconcat config.paths.vendor.concatName)
    .pipe(gsize title: 'js:vendor output')
    .pipe(g.dest config.paths.vendor.dst)

  g.task 'js:compile', ['coffee:transpile', 'soy:transpile'], ->
    gcompiler = require 'gulp-closure-compiler'

    level = switch config.argv.level
      when 1 then 'SIMPLE_OPTIMIZATIONS'
      when 2 then 'ADVANCED_OPTIMIZATIONS'
      else 'WHITESPACE_ONLY'

    g.src(config.paths.js.srcGlob)
    .pipe(gsize title: 'js:compile source')
    .pipe(gcompiler
      fileName: path.join config.paths.js.devBuildDst, config.paths.js.nameMinified
      maxBuffer: 10000
      compilerPath: config.paths.js.compiler
      compilerFlags:
        closure_entry_point: 'sandbox.Bootstrap'
        define: [
          'goog.DEBUG=' + config.argv.debug
        ]
        compilation_level: level
        only_closure_dependencies: yes
        output_manifest: path.join config.paths.js.devBuildDst, config.paths.js.compiledManifest
        output_wrapper: '(function(){%output%})();'
        warning_level: 'QUIET'
        externs: [
          'node_modules/react-externs/externs.js'
        ]
    )
    .pipe(gsize title: 'js:compile output')

  g.task 'js:deps', ['coffee:transpile', 'soy:transpile'], ->
    gdeps = require 'gulp-closure-deps'

    g.src(config.paths.js.srcDepsGlob)
    .pipe(gsize title: 'js:deps source')
    .pipe(gdeps
      fileName: config.paths.js.nameDeps
      prefix: config.paths.js.depsRelative
      baseDir: config.paths.app.dst
    )
    .pipe(gsize title: 'js:deps output')
    .pipe(g.dest config.paths.js.devDst)
    .pipe(gconnect.reload())
