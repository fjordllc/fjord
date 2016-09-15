$(document).on 'turbolinks:load', ->
  windowHeight = $(window).outerHeight()
  $('.js-window-height').css 'height', windowHeight + 'px'
$(window).resize ->
  windowHeight = $(window).outerHeight()
  $('.js-window-height').css 'height', windowHeight + 'px'
$(document).on 'turbolinks:load', ->
  $('.js-main-height').exResize ->
    windowHeight = $(window).outerHeight()
    $('.js-window-height').css 'height', windowHeight + 'px'
