$ ->
  $('#tracker .js-select').on 'change', ->
    projectId = $(this).val()

    console.log('projectId: ', projectId)

    success = (data) =>
      console.log('success')
      location.reload()

    if projectId
      $.ajax
        type:    'POST',
        url:     "/projects/#{projectId}/transaction",
        success: success

  $('#tracker .js-stop').on 'click', ->
    projectId = $('#tracker select').val()

    console.log('projectId: ', projectId)

    success = (data) =>
      console.log('success')
      location.reload()

    if projectId
      $.ajax
        type:    'DELETE',
        url:     "/projects/#{projectId}/transaction",
        success: success
