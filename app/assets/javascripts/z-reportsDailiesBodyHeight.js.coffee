$(document).on 'turbolinks:load', ->
  headerHeight = $('.js-header-height').outerHeight()
  footerHeight = $('.js-footer-height').outerHeight()
  bodyNavrHeight = $('.js-body-nav-height').outerHeight()
  reportsDailiesBodyHeight = $(window).outerHeight() - (headerHeight + footerHeight + bodyNavrHeight)
  $('.js-reports-dailies-body-height').css 'height', reportsDailiesBodyHeight + 'px'
$(window).resize ->
  headerHeight = $('.js-header-height').outerHeight()
  footerHeight = $('.js-footer-height').outerHeight()
  bodyNavrHeight = $('.js-body-nav-height').outerHeight()
  reportsDailiesBodyHeight = $(window).outerHeight() - (headerHeight + footerHeight + bodyNavrHeight)
  $('.js-reports-dailies-body-height').css 'height', reportsDailiesBodyHeight + 'px'
$(document).on 'turbolinks:load', ->
  $('.js-main-height').exResize ->
    headerHeight = $('.js-header-height').outerHeight()
    footerHeight = $('.js-footer-height').outerHeight()
    bodyNavrHeight = $('.js-body-nav-height').outerHeight()
    reportsDailiesBodyHeight = $(window).outerHeight() - (headerHeight + footerHeight + bodyNavrHeight)
    $('.js-reports-dailies-body-height').css 'height', reportsDailiesBodyHeight + 'px'
