require 'rails_helper'

describe 'news feed' do 

	let(:user_one) { User.create email: 'hello@hi.com', password: '12345678', password_confirmation: '12345678'}
	let(:user_two) {User.create email: "sup@lo.com", password: '12345678', password_confirmation: '12345678'}
	before { user_one.posts.create title: "Pretty Picture"}

	def user_one_logs_in_and_user_two_visits_news
		login_as user_one
		visit '/'
		click_link '♥ 0'
		logout(:user_one)
		login_as user_two
		visit '/news'
	end

	context 'followed vs not followed', js: true do 

		it ' if followed will alert me when somebody has liked a post' do
			user_two.follow user_one
			user_one_logs_in_and_user_two_visits_news
			sleep 5
			expect(page).to have_content 'hello@hi.com liked Pretty Picture'

		end

		it ' if not, will show me nothing if I haven\'t followed them' do 
			user_one_logs_in_and_user_two_visits_news
			expect(page).not_to have_content 'hello@hi.com liked Pretty Picture'

		end


		it 'will alert me when somebody has created a new post' do 
			login_as user_one
			visit '/posts/new'
			fill_in 'Title', with: 'Hello World'
			click_button 'Create Post'
			logout(:user_one)
			login_as user_two
			user_two.follow user_one
			visit '/news'
			expect(page).to have_content 'hello@hi.com posted Hello World'
		end

	end


end