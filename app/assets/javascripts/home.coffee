$(document).on 'turbolinks:load', ->
  $('.js-datepicker').datepicker().on 'changeDate', (e) ->
    date = new Date(e.date)
    queries = parseQuery()
    queries['day'] = toFormattedDate(date)
    console.log toFormattedDate(date)
    Turbolinks.visit "#{location.pathname}?#{toQueryString(queries)}", { action: "replace" }
