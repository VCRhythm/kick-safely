# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
	$(".review-btn").click ->
		$(this).parent().parent().children(".review-input").show()
		$(this).parent().parent().children(".review-comments").hide()

	$(".review-cancel").click ->
		$(this).parent().parent().parent().children(".review-comments").show()
		$(this).parent().parent(".review-input").hide()
