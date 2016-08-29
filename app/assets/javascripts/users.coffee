$(document).on 'turbolinks:load', ->
  $('body.users-show .js-datepicker').datepicker().on 'changeDate', (e) ->
    path = location.pathname.split('/').slice(0, 3).join('/')
    Turbolinks.visit "#{path}/#{toFormattedDate(new Date(e.date))}", { action: "replace" }
