class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def new
	end

	def create
		@post = Post.create post_params
		redirect_to '/posts'
	end

	def index
		@posts = Post.all 
	end

	def show
		@post = Post.find params[:id]
	end

	private

	def post_params
		params.require(:post).permit(:title, :image, :tag_names, :address)
	end


end
