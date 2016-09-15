$(document).on 'turbolinks:load', ->
  headerHeight = $('.js-header-height').outerHeight()
  footerHeight = $('.js-footer-height').outerHeight()
  bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
  $('.js-body-height').css 'height', bodyHeight + 'px'
$(window).resize ->
  headerHeight = $('.js-header-height').outerHeight()
  footerHeight = $('.js-footer-height').outerHeight()
  bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
  $('.js-body-height').css 'height', bodyHeight + 'px'
$(document).on 'turbolinks:load', ->
  $('.js-main-height', '.js-activities-footer-height').exResize ->
    headerHeight = $('.js-header-height').outerHeight()
    footerHeight = $('.js-footer-height').outerHeight()
    bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
    $('.js-body-height').css 'height', bodyHeight + 'px'
