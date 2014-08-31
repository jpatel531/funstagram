require 'rails_helper'

describe 'news feed' do 

	let(:user_one) { User.create email: 'hello@hi.com', password: '12345678', password_confirmation: '12345678'}
	let(:user_two) {User.create email: "sup@lo.com", password: '12345678', password_confirmation: '12345678'}
	before { Post.create title: "Pretty Picture"}

	context 'likes broadcast', js: true do 

		it 'will alert me when somebody has liked a post' do 
			login_as user_one
			visit '/'
			# save_and_open_page
			click_link '♥ 0'
			logout(:user_one)
			login_as user_two
			visit '/news'
			expect(page).to have_content 'hello@hi.com liked Pretty Picture'

		end

	end


end