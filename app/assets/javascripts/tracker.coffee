$ ->
  $('#tracker select').on 'change', ->
    projectId = $(this).val()

    success = (data) =>
      console.log('success')
      location.reload()

    if projectId
      $.ajax
        type:    'POST',
        url:     "/projects/#{projectId}/transaction",
        success: success

  $('#tracker .stop').on 'click', ->
    projectId = $('#tracker select').val()

    success = (data) =>
      console.log('success')
      location.reload()

    if projectId
      $.ajax
        type:    'DELETE',
        url:     "/projects/#{projectId}/transaction",
        success: success
