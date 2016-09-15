$(document).on 'turbolinks:load', ->
  headerHeight = $('.js-header-height').outerHeight()
  bodyNavHeight = $('.js-body-nav-height').outerHeight()
  calendarHeaderHeight = $('.js-calendar-header-height').outerHeight()
  calendarBodyHeight = $(window).outerHeight() - (headerHeight + bodyNavHeight + calendarHeaderHeight)
  $('.js-calendar-body-height').css 'height', calendarBodyHeight + 'px'
$(window).resize ->
  headerHeight = $('.js-header-height').outerHeight()
  bodyNavHeight = $('.js-body-nav-height').outerHeight()
  calendarHeaderHeight = $('.js-calendar-header-height').outerHeight()
  calendarBodyHeight = $(window).outerHeight() - (headerHeight + bodyNavHeight + calendarHeaderHeight)
  $('.js-calendar-body-height').css 'height', calendarBodyHeight + 'px'
