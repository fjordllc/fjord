window.toFormattedDate = (date) ->
  month = ('00' + (date.getMonth() + 1)).slice(-2)
  day   = ('00' + date.getDate()).slice(-2)
  "#{date.getFullYear()}-#{month}-#{day}"

window.toFormattedMonth = (date) ->
  month = ('00' + (date.getMonth() + 1)).slice(-2)
  "#{date.getFullYear()}-#{month}"

window.parseQuery = ->
  return {} unless location.search

  queries = {}
  strings = location.search.substring(1).split('&')
  for string in strings
    [key, value] = string.split('=')
    queries[key] = value

  queries

window.toQueryString = (queries) ->
  result = []
  for key, value of queries
    result.push "#{key}=#{value}"
  result.join('&')
