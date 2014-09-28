class NewsController < ApplicationController

	before_action :authenticate_user!

	def index
		@activities = PublicActivity::Activity.all.select do |activity|
			current_user.following_users.include? activity.owner	
		end

		
		# @activities = PublicActivity::Activity.where(owner_id: current_user.following_users)

		# raise current_user.following_users.inspect
	end

end
