$(document).on 'turbolinks:load', ->
  $('body.reports-dailies-index .js-datepicker').datepicker().on 'changeDate', (e) ->
    Turbolinks.visit "/reports/dailies?day=#{toFormattedDate(new Date(e.date))}", { action: "replace" }

$(document).on 'turbolinks:load', ->
  $('body.reports-months-index .js-datepicker').datepicker().on 'changeDate', (e) ->
    Turbolinks.visit "/reports/months?month=#{toFormattedMonth(new Date(e.date))}", { action: "replace" }
