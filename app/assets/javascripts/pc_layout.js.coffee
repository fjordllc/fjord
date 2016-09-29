$(document).on 'turbolinks:load', ->
  setBodyHeight = ->
    headerHeight = $('.js-header-height').outerHeight()
    footerHeight = $('.js-footer-height').outerHeight()
    bodyHeight = $(window).outerHeight() - (headerHeight + footerHeight)
    $('.js-body-height').css 'height', bodyHeight + 'px'

  setCalendarBodyHeight = ->
    headerHeight = $('.js-header-height').outerHeight()
    bodyNavHeight = $('.js-body-nav-height').outerHeight()
    calendarHeaderHeight = $('.js-calendar-header-height').outerHeight()
    calendarBodyHeight = $(window).outerHeight() - (headerHeight + bodyNavHeight + calendarHeaderHeight)
    $('.js-calendar-body-height').css 'height', calendarBodyHeight + 'px'

  setWindowHeight = ->
    windowHeight = $(window).outerHeight()
    $('.js-window-height').css 'height', windowHeight + 'px'

  setActivitiesBodyHeight = ->
    activitiesHeaderHeight = $('.js-activities-header-height').outerHeight()
    activitiesFooterHeight = $('.js-activities-footer-height').outerHeight()
    bodyHeight = $('.js-body-height').outerHeight()
    activitiesBodyHeight = bodyHeight - (activitiesHeaderHeight + activitiesFooterHeight)
    $('.js-activities-body-height').css 'height', activitiesBodyHeight + 'px'

  setReportsDailiesBodyHeight = ->
    headerHeight = $('.js-header-height').outerHeight()
    footerHeight = $('.js-footer-height').outerHeight()
    bodyNavrHeight = $('.js-body-nav-height').outerHeight()
    reportsDailiesBodyHeight = $(window).outerHeight() - (headerHeight + footerHeight + bodyNavrHeight)
    $('.js-reports-dailies-body-height').css 'height', reportsDailiesBodyHeight + 'px'

  $(document).on 'turbolinks:load', setBodyHeight()
  $(window).resize -> setBodyHeight()

  $(document).on 'turbolinks:load', setCalendarBodyHeight()
  $(window).resize -> setCalendarBodyHeight()

  $(document).on 'turbolinks:load', setWindowHeight()
  $(window).resize -> setWindowHeight()

  $(document).on 'turbolinks:load', setActivitiesBodyHeight()
  $(window).resize -> setActivitiesBodyHeight()

  $(document).on 'turbolinks:load', setReportsDailiesBodyHeight()
  $(window).resize -> setReportsDailiesBodyHeight()
