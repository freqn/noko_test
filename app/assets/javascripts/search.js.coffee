# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(window).scroll ->
  scroll = $(window).scrollTop()
  if scroll > 0
    $(".navbar, .dropdown-menu").addClass "active"
    $(".navbar-brand, .navbar-right li a").addClass "white"
    $(".navbar-brand, .navbar-right li a").removeClass "dark"
  else
    $(".navbar, .dropdown-menu").removeClass "active"
    $(".navbar-brand, .navbar-right li a").removeClass "white"
    $(".navbar-brand, .navbar-right li a").addClass "dark"
  return
