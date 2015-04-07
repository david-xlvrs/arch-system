module.exports = (g, gsize, config) ->

	g.task 'coffee:transpile', [], ->
		# coffee do JS
		gchanged = require 'gulp-changed'
		gcoffee = require 'gulp-coffee'
		gcoffee2closure = require 'gulp-coffee2closure'

		g.src(config.paths.coffee.srcGlob)
		.pipe(gchanged config.paths.js.dst, extension: '.js')
		.pipe(gsize title: 'coffee:transpile source')
		.pipe(gcoffee bare: yes)
		.pipe(gcoffee2closure())
		.pipe(gsize title: 'coffee:transpile output')
		.pipe(g.dest config.paths.js.dst)

	# min na prod
	g.task 'js:transpile', [if config.argv.production then 'js:minify' else 'js:deps']

	g.task 'js:minify', ['coffee:transpile'], ->
		gcompiler = require 'gulp-closure-compiler'

		level = switch config.argv.level
			when 1 then 'SIMPLE_OPTIMIZATIONS'
			when 2 then 'ADVANCED_OPTIMIZATIONS'
			else 'WHITESPACE_ONLY'

		g.src(config.paths.js.srcGlob)
		.pipe(gsize title: 'js:minify source')
		.pipe(gcompiler
			fileName: config.paths.js.dstMinified
			maxBuffer: 10000
			compilerPath: config.paths.js.compiler
			compilerFlags:
				closure_entry_point: 'sandbox.Bootstrap'
				define: [
					'goog.DEBUG=' + config.argv.debug.toString()
				]
				compilation_level: level
				only_closure_dependencies: yes
				output_wrapper: '(function(){%output%})();'
				warning_level: 'QUIET'
				jscomp_off: [
					'globalThis' # get past the first batch of errors
				]
				externs: [
					'node_modules/react-externs/externs.js'
				]
		)
		.pipe(gsize title: 'js:minify minified')
		# .pipe(g.dest config.paths.js.dst)

	g.task 'js:deps', ['coffee:transpile', 'copy:closure', 'copy:react'], ->
		gdeps = require 'gulp-closure-deps'
		path = require 'path'
		gconnect = require 'gulp-connect'

		g.src(config.paths.js.srcDepsGlob)
		.pipe(gsize title: 'js:deps source')
		.pipe(gdeps
			fileName: path.relative config.paths.js.dst, config.paths.js.depsDst
			prefix: '../../../../'
			baseDir: config.paths.app.dst
		)
		.pipe(gsize title: 'js:deps')
		.pipe(g.dest config.paths.js.dst)
		.pipe(gconnect.reload())
