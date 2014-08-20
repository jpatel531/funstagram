$(document).ready ->
	$.get '../tags.json', (tags) ->
		$('.bootstrap-tagsinput input').typeahead {source: tags}
