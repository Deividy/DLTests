class AjaxNav
 # loadAjaxPages
 loadPage: (link, data) ->
  #gogo link!
  goToLink = $.ajax({
  type: 'GET'
  url: link
  data: data
  beforeSend: ->
   $('#content').html('Loading...')
  }).done((ret) ->
   $('#content').html(ret)
   onDoneLoadIt()
  )

 ###
  i wanna load all that when all ajax done, cause have a bug with ajax pages dont load by ajax again
  So i make that function, i really dont know if is the best way, but is working
 ###
 onDoneLoadIt = ->
  #submit some form always be request ajax
  $('form').submit(->
   formData = $(this).serialize()       #serialize that
   link = $(this).attr('action')        #get url
   goToLink = $.ajax({
    type: 'POST'
    url: link
    data: formData
    beforeSend: ->
     $('#content').html('Loading...')
    }).done((ret) ->
     $('#content').html(ret)
     onDoneLoadIt()
    )
   false
  )
  #links always will be a request ajax
  $('a').click(->
   formData = $(this).serialize()       #serialize that
   link = $(this).attr('href')          #get url
   window.location.hash =  "#" + link;  #change hash
   #loadPage(link)
   false
  )
