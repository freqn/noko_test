# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  scroll = $(window).scrollTop()
  nav_header = ".navbar-brand, .navbar-right li a"
  if scroll > 0
    $(".navbar, .dropdown-menu").addClass "active"
    $(nav_header).addClass "white"
    $(nav_header).removeClass "dark"
  else
    $(".navbar, .dropdown-menu").removeClass "active"
    $(nav_header).removeClass "white"
    $(nav_header).addClass "dark"
  return
