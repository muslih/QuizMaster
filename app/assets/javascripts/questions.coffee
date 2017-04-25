# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  $('select#question_answer_type').change ->
    answer_list = undefined
    answer_list = $('.answer_list')
    if $(this).val() == 'text'
      answer_list.hide()
      answer_list.first().show()
    else
      return answer_list.toggle()
    return

