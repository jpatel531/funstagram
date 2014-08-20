class LikesController < ApplicationController

	def create
		@post = Post.find params[:post_id]
		@post.likes.create
		WebsocketRails[:likes].trigger 'new', {post_id: @post.id, new_like_count: @post.likes.count}

		redirect_to '/posts'
	end

end
