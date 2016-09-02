$ ->
  timer = (startUnixtime) ->
    nowUnixtime = Math.floor((new Date).getTime() / 1000)
    distance = nowUnixtime - startUnixtime

    hour = Math.floor(distance / 3600)
    min  = Math.floor(distance % 3600 / 60)
    sec  = Math.floor(distance % 60)
    [
      "0#{hour}".slice(-2),
      "0#{min}".slice(-2),
      "0#{sec}".slice(-2),
    ].join(':')

  setInterval =>
    startUnixtime = $('.js-timer').data('start-unixtime')
    if startUnixtime
      $('.js-timer')[0].innerText = timer(startUnixtime)
  ,   1000

$ ->
  autosize($('textarea'))
