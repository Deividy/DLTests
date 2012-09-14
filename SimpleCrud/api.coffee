# Not implemented yet.
class Api
 @signed = (req, res, next) =>
  if @is_signed(req)
   next()
  else
   res.render('login')

 @is_signed = (req) ->
  true

module.exports =
 Api:Api
