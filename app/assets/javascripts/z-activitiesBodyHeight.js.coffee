$(document).on 'turbolinks:load', ->
  activitiesHeaderHeight = $('.js-activities-header-height').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer-height').outerHeight()
  bodyHeight = $('.js-body-height').outerHeight()
  activitiesBodyHeight = bodyHeight - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body-height').css 'height', activitiesBodyHeight + 'px'
$(window).resize ->
  activitiesHeaderHeight = $('.js-activities-header-height').outerHeight()
  activitiesFooterHeight = $('.js-activities-footer-height').outerHeight()
  bodyHeight = $('.js-body-height').outerHeight()
  activitiesBodyHeight = bodyHeight - (activitiesHeaderHeight + activitiesFooterHeight)
  $('.js-activities-body-height').css 'height', activitiesBodyHeight + 'px'
