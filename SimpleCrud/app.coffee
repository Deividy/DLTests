express = require('express')
app = express()

app.configure ->
 app.set('views', "#{__dirname}/public/views")
 app.set('view engine', 'jade')
 app.use(express.static("#{__dirname}/public"))
 app.use(express.bodyParser())
 app.use(app.router)

require('./routes').routes(app)

app.listen(8000)
