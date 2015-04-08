module.exports = (g, gsize, config) ->

	g.task 'coffee:lint', [], ->
		gcoffeelint = require 'gulp-coffeelint'

		g.src(config.paths.coffee.srcGlob)
		.pipe(gsize title: 'coffee:lint source')
		.pipe(gcoffeelint config.paths.coffee.lint)
		.pipe(gcoffeelint.reporter())
