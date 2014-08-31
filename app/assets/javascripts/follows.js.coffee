# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	$('.follow-button').on 'click', (event) ->

		event.preventDefault()
		url = '/follows'
		# this = $(@)
		data = $(@).data('to-follow')
		$.post url, {follow: data}
		string = $(@).text().replace('Follow', 'Following')
		$(@).text(string)
		$(@).removeAttr("href")
		$(@).removeClass('follow-button')
		$(@).addClass('disabled')
		$(@).css('cursor', 'default').css('color', 'black').css
		$(@).off('hover')

		