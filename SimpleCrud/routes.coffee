routes = (app) ->
 require('./routes/default')(app)
 require('./routes/users')(app)

module.exports =
 routes: routes
