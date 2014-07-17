$(document).ready(function(){
	$('.like-button').on('click', function(event){
		event.preventDefault();
		var url = $(this).attr('href');
		$.post(url)
	})

	var connection = new WebSocketRails(window.location.host + '/websocket');
	var likesChannel = connection.subscribe('likes');
	likesChannel.bind('new', function(post){
		$('.like-button[data-post-id=' + post.post_id + ']').text('♥ ' + post.new_like_count);
	});
});

