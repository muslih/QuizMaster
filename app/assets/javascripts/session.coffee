# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

@loginform = (target) ->
	console.log target
	$(target).toggle()
	$('.login-method').toggle()

# @tes = ->
# 	console.log $(@).data()