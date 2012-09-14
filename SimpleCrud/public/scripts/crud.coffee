$(document).ready(->
 m = new AjaxNav()
 #Handling with hashs
 hashNav = ->
  browserHash = window.location.hash.substring(1)
  if browserHash 
   m.loadPage(browserHash);
  else
   m.loadPage('/index')
 
 $(window).bind('hashchange', ->
  hashNav()
 )
 
 #load pages
 hashNav()
)
