$(document).on 'turbolinks:load', ->
  activitiesHeaderHeight = $('.js-activities-header-height').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer-height').outerHeight()
  activitiesBodyHeight = $('.js-body-height').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body-height').css 'height', activitiesBodyHeight + 'px'
$(window).resize ->
  activitiesHeaderHeight = $('.js-activities-header-height').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer-height').outerHeight()
  activitiesBodyHeight = $('.js-body-height').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body-height').css 'height', activitiesBodyHeight + 'px'
$('.js-main-height', '.js-activities-footer-height').exResize ->
  activitiesHeaderHeight = $('.js-activities-header-height').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer-height').outerHeight()
  activitiesBodyHeight = $('.js-body-height').outerHeight() - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body-height').css 'height', activitiesBodyHeight + 'px'
