gsize = require 'gulp-size'
gif = require 'gulp-if'

module.exports = (config) ->

  (opts) ->
    opts.showFiles ?= config.argv.info > 1
    gif(config.argv.info > 0, gsize opts)
