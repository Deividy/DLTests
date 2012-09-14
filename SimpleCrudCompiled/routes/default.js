// Generated by CoffeeScript 1.3.3
(function() {
  var Default,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Default = (function(_super) {

    __extends(Default, _super);

    function Default() {
      return Default.__super__.constructor.apply(this, arguments);
    }

    Default.routes = function(app) {
      app.get('/', function(req, res) {
        return res.render('default');
      });
      return app.get('/index', Default.signed, function(req, res) {
        return res.render('index');
      });
    };

    return Default;

  }).call(this, require('../api').Api);

  module.exports = Default.routes;

}).call(this);