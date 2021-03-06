// Generated by CoffeeScript 1.3.3
(function() {
  var Api;

  Api = (function() {
    var _this = this;

    function Api() {}

    Api.signed = function(req, res, next) {
      if (Api.is_signed(req)) {
        return next();
      } else {
        return res.render('login');
      }
    };

    Api.is_signed = function(req) {
      return true;
    };

    return Api;

  }).call(this);

  module.exports = {
    Api: Api
  };

}).call(this);
