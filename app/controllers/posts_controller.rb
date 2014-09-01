class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def new
	end

	def create
		@user = current_user
		@post = @user.posts.create post_params
		@post.create_activity(:posted, owner: current_user)
		redirect_to '/posts'
	end

	def index
		@posts = Post.all 
	end

	def show
		@post = Post.find params[:id]
	end

	def destroy
		@post = Post.find params[:id]
		@post.destroy!
		redirect_to '/posts'
	end

	private

	def post_params
		params.require(:post).permit(:title, :image, :tag_names, :address)
	end


end
