db = require('../db')()
tds = require('tds')
newConn = ->
 conn = new tds.Connection({
  host: db.mssql.host
  port: db.mssql.port
  userName: db.mssql.userName
  password: db.mssql.password
  database: db.mssql.database
 })
 conn

# I used the routes like it was some kind of controller
class Users extends require('../api').Api
 @routes: (app) =>

  ### List all users ###
  app.get '/users/list', @signed, (req, res) ->
   data = []
   conn = newConn()
   conn.connect(->
    stmt = conn.createStatement('SELECT users_id, login, pass FROM users')
    stmt.on('row', (row) =>
      data.push({
       users_id:row.getValue('users_id')
       login: row.getValue('login')
       pass: row.getValue('pass')
      })
    )
    stmt.on('done', =>
     console.log(data)
     res.render('users/list',
      users: data
      )
    )
    stmt.execute()
   )
  ### Add user interface ###
  app.get '/users/add', @signed, (req, res) ->
   res.render('users/add')

  ### Edit user interface ###
  app.get '/users/edit/:id', @signed, (req, res) ->
   data = {}
   conn = newConn()
   conn.connect(->
    stmt = conn.createStatement('SELECT users_id, login, pass FROM users where users_id = '+req.params.id)
    stmt.on('row', (row) =>
      data = {
       users_id:row.getValue('users_id')
       login: row.getValue('login')
       pass: row.getValue('pass')
      }
    )
    stmt.on('done', =>
     console.log(data)
     res.render('users/edit',
      user: data
      )
    )
    stmt.execute()
   )

  ### Save user ###
  app.post '/users/save', @signed, (req, res) ->
   login = req.body.login
   pass = req.body.password
   id = req.body.id  ? 0
   conn = newConn()
   conn.connect(->
    if id
     console.log("UPDATE users set login = '#{login}', pass = '#{pass}' where users_id = '#{id}'")
     stmt = conn.createStatement("UPDATE users set login = '#{login}', pass = '#{pass}' where users_id = '#{id}'")
    else
     stmt = conn.createStatement("INSERT INTO users(login, pass) VALUES ('#{login}', '#{pass}')")
    stmt.on('done', =>
     res.redirect('/users/list')
    )
    stmt.execute()
   )

  ### Delete user ###
  app.get '/users/delete/:id', @signed, (req, res) ->
   conn = newConn()
   conn.connect(->
    stmt = conn.createStatement('DELETE FROM users where users_id = '+req.params.id)
    stmt.on('done', =>
     res.redirect('/users/list')
    )
    stmt.execute()
   )

module.exports = Users.routes
