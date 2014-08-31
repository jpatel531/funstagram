class FollowsController < ApplicationController

	def create
		current_user.follow(User.find params[:follow])
		render json: {success: 200}
	end

end
