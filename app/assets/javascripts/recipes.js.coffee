# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.recipe-title').on 'click', (event) ->
    event.preventDefault()
    $functions = $('#recipe-functions')
    if $functions.is(":hidden")
      $('.recipe-title span').removeClass('fa-caret-down').addClass('fa-caret-up')
      return $functions.slideDown('fast')
    if $functions.is(":visible")
      $('.recipe-title span').removeClass('fa-caret-up').addClass('fa-caret-down')
      return $functions.slideUp('fast')
