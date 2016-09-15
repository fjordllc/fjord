$(document).on 'turbolinks:load', ->
  $('.js-project-status-item-show__trigger').click ->
    parent = $(this).parents('.js-project-status-item-show')
    target = $(parent).find('.js-project-status-item-show__target')
    if $(target).hasClass('is-shown')
      $(target).removeClass('is-shown')
      $(parent).removeClass('is-shown')
    else
      $(target).addClass('is-shown')
      $(parent).addClass('is-shown')
