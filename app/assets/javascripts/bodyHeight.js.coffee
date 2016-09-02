$(document).on 'turbolinks:load', ->
  headerHeight = $('.js-header').outerHeight()
  footerHeight = $('.js-footer').outerHeight()
  bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
  $('.js-body').css 'height', bodyHeight + 'px'
$(window, '.js-main').resize ->
  headerHeight = $('.js-header').outerHeight()
  footerHeight = $('.js-footer').outerHeight()
  bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
  $('.js-body').css 'height', bodyHeight + 'px'

$(document).on 'turbolinks:load', ->
  activitiesHeaderHeight = $('.js-activities-header').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer').outerHeight()
  activitiesBodyHeight = $('.js-body').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body').css 'height', activitiesBodyHeight + 'px'
$(window, '.js-main').resize ->
  activitiesHeaderHeight = $('.js-activities-header').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer').outerHeight()
  activitiesBodyHeight = $('.js-body').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body').css 'height', activitiesBodyHeight + 'px'

$(document).on 'turbolinks:load', ->
  windowHeight = $(window).outerHeight()
  $('.js-window-height').css 'height', windowHeight + 'px'
$(window, '.js-main').resize ->
  windowHeight = $(window).outerHeight()
  $('.js-window-height').css 'height', windowHeight + 'px'
