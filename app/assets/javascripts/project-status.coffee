$ ->
  $('.js-project-status-item-show__trigger').click ->
    parent = $(this).parents('.js-project-status-item-show')
    target = $(parent).find('.js-project-status-item-show__target')
    if $(target).hasClass('is-active')
      $(target).removeClass('is-active')
    else
      $(target).addClass('is-active')
