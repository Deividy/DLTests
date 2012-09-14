class Default extends require('../api').Api
 @routes: (app) =>

  app.get '/', (req, res) ->
   res.render('default')

  app.get '/index', @signed, (req, res) ->
   res.render('index')

module.exports = Default.routes
