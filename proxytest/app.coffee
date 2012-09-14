httpProxy = require 'http-proxy'
express = require 'express'

routingProxy = new httpProxy.RoutingProxy()
apiProxy = (pattern, host, port) ->
 (req, res, next) ->
  if req.url.match(pattern)
   routingProxy.proxyRequest req, res, host: host, port: port
  else
   next()

app = express()

app.configure ->
 @use apiProxy '/ToolBox', '192.168.10.1', '85'
 @use express.bodyParser()

app.get '/Test', (req, res) ->
 res.send('Hi')

app.listen(7000)
