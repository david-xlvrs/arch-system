module.exports = (g, config) ->

  g.task 'clean:app', (done) ->
    del = require 'del'

    del config.paths.app.dst, done
