port = process.env.PORT or 9000
livereloadPort = process.env.LIVERELOAD_PORT or 35730
env = process.env.NODE_ENV or 'development'

g = require 'gulp'
gconnect = require 'gulp-connect'
open = require 'open'
config = require './tasks/config'
config.argv = require('./tasks/argv-settings')
gsize = require('./tasks/gulp-size-verbose') config
require('./tasks/gulp-catch-error') g, config
require('./tasks/clean.tasks') g, config
require('./tasks/copy.tasks') g, gsize, config
require('./tasks/index.tasks') g, gsize, config
require('./tasks/js.tasks') g, gsize, config
require('./tasks/soy.tasks') g, gsize, config
require('./tasks/less.tasks') g, gsize, config
require('./tasks/lint.tasks') g, gsize, config

g.task 'clean', ['clean:app'], ->
  return

g.task 'build', ['copy:all', 'less:transpile', 'js:all', 'index:create'], ->
  return

g.task 'lint', ['coffee:lint'], ->
  return

g.task 'watch', ['build'], ->
  g.watch [
    config.paths.img.srcGlob
    config.paths.static.srcGlob
  ], ['copy:all']
  g.watch [
    config.paths.sprites.srcGlob
    config.paths.less.srcGlob
  ], ['less:transpile']
  g.watch [
    config.paths.coffee.srcGlob
    config.paths.soy.srcGlob
  ], ['js:all']
  g.watch config.paths.index.template, ['index:create']

g.task 'serve', ->
  liverload = if env is 'development'
    port: livereloadPort
  else
    no

  gconnect.server
    root: [config.paths.app.dst]
    port: port
    livereload: liverload

  open 'http://localhost:' + port

g.task 'default', ['build'], ->
  return
