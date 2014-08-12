# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  scroll = $(window).scrollTop()
  nav_trans = ".navbar-brand, .navbar-right li a"
  nav_drop = ".navbar, .dropdown-menu"
  if scroll > 0
    $(nav_drop).addClass "active"
    $(nav_trans).addClass "white"
    $(nav_trans).removeClass "dark"
  else
    $(nav_drop).removeClass "active"
    $(nav_trans).removeClass "white"
    $(nav_trans).addClass "dark"
  return

