port = process.env.PORT or 9000
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


g.task 'clean', ['clean:app'], ->
	return

buildTaskDeps = ['copy:all', 'less:transpile', 'js:transpile', 'soy:transpile', 'index:create']
g.task 'build', buildTaskDeps, ->
	return

g.task 'lint', ['coffee:lint', 'js:lint'], ->
	return

g.task 'watch', ['build'], ->
	watchTaskDeps = if config.argv.timeInTitle then ['index:create'] else []
	g.watch [
		config.paths.img.srcGlob
		config.paths.static.srcGlob
	], watchTaskDeps.concat 'copy:all'
	g.watch [
		config.paths.sprites.srcGlob
		config.paths.less.srcGlob
	], watchTaskDeps.concat 'less:transpile'
	g.watch config.paths.coffee.srcGlob, watchTaskDeps.concat 'js:transpile'
	g.watch config.paths.soy.srcGlob, watchTaskDeps.concat ['soy:transpile', 'js:transpile']
	g.watch config.paths.index.srcGlob, ['index:create']

g.task 'serve', ->
	gconnect.server
		root: ['dist']
		port: port
		livereload: env is 'development'

	open 'http://localhost:' + port

g.task 'default', ['build'], ->
	return
