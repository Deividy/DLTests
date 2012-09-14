// Generated by CoffeeScript 1.3.3
//(function() {
  var AjaxNav;

  AjaxNav = (function() {
    var onDoneLoadIt;

    function AjaxNav() {}

    AjaxNav.prototype.loadPage = function(link, data) {
      var goToLink;
      return goToLink = $.ajax({
        type: 'GET',
        url: link,
        data: data,
        beforeSend: function() {
          return $('#content').html('Loading...');
        }
      }).done(function(ret) {
        $('#content').html(ret);
        return onDoneLoadIt();
      });
    };

    /*
      i wanna load all that when all ajax done, cause have a bug with ajax pages dont load by ajax again
      So i make that function, i really dont know if is the best way, but is working
    */


    onDoneLoadIt = function() {
      $('form').submit(function() {
        var formData, goToLink, link;
        formData = $(this).serialize();
        link = $(this).attr('action');
        goToLink = $.ajax({
          type: 'POST',
          url: link,
          data: formData,
          beforeSend: function() {
            return $('#content').html('Loading...');
          }
        }).done(function(ret) {
          $('#content').html(ret);
          return onDoneLoadIt();
        });
        return false;
      });
      return $('a').click(function() {
        var formData, link;
        formData = $(this).serialize();
        link = $(this).attr('href');
        window.location.hash = "#" + link;
        return false;
      });
    };

    return AjaxNav;

  })();

//}).call(this);
