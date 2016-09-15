$(document).on 'turbolinks:load', ->
  headerHeight = $('.js-header').outerHeight()
  footerHeight = $('.js-footer').outerHeight()
  bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
  $('.js-body').css 'height', bodyHeight + 'px'
$(window).resize ->
  headerHeight = $('.js-header').outerHeight()
  footerHeight = $('.js-footer').outerHeight()
  bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
  $('.js-body').css 'height', bodyHeight + 'px'
$(document).on 'turbolinks:load', ->
  $('.js-main', '.js-activities-footer').exResize ->
    headerHeight = $('.js-header').outerHeight()
    footerHeight = $('.js-footer').outerHeight()
    bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
    $('.js-body').css 'height', bodyHeight + 'px'

$(document).on 'turbolinks:load', ->
  activitiesHeaderHeight = $('.js-activities-header').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer').outerHeight()
  activitiesBodyHeight = $('.js-body').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body').css 'height', activitiesBodyHeight + 'px'
$(window).resize ->
  activitiesHeaderHeight = $('.js-activities-header').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer').outerHeight()
  activitiesBodyHeight = $('.js-body').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body').css 'height', activitiesBodyHeight + 'px'
$('.js-main', '.js-activities-footer').exResize ->
  activitiesHeaderHeight = $('.js-activities-header').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer').outerHeight()
  activitiesBodyHeight = $('.js-body').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body').css 'height', activitiesBodyHeight + 'px'

$(document).on 'turbolinks:load', ->
  windowHeight = $(window).outerHeight()
  $('.js-window-height').css 'height', windowHeight + 'px'
$(window).resize ->
  windowHeight = $(window).outerHeight()
  $('.js-window-height').css 'height', windowHeight + 'px'
$(document).on 'turbolinks:load', ->
  $('.js-main').exResize ->
    windowHeight = $(window).outerHeight()
    $('.js-window-height').css 'height', windowHeight + 'px'
