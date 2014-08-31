class LikesController < ApplicationController

	def create
		@post = Post.find params[:post_id]
		like = @post.likes.create
		like.create_activity(:liked, owner: current_user, recipient: @post)
		WebsocketRails[:likes].trigger 'new', {post_id: @post.id, new_like_count: @post.likes.count}

		redirect_to '/posts'
	end

end
