chalk = require 'chalk'
gif = require 'gulp-if'
gplumber = require 'gulp-plumber'
notifier = require 'node-notifier'

onError = (err) ->
	# beep
	process.stdout.write '\x07'

	unless err.message
		console.log err
		return

	name = err.name or 'Unknown error'
	plugin = err.plugin or 'unknown'
	title = "#{name} from #{plugin}"

	console.log chalk.red title
	console.log err.toString()

	notification =
		title: title
		message: err.message
	notification.subtitle = '...' + err.filename.slice(-40) if err.filename
	notifier.notify notification
	return

module.exports = (g, config) ->
	oldSrc = g.src
	g.src = () ->
		oldSrc.apply(g, Array::slice.call arguments, 0)
		.pipe(gif(config.argv.continueOnError, gplumber errorHandler: onError))
	g
