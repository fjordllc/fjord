$(document).on 'turbolinks:load', ->
  $('body.home-index .js-datepicker').datepicker().on 'changeDate', (e) ->
    Turbolinks.visit "/#{toFormattedDate(new Date(e.date))}", { action: "replace" }
