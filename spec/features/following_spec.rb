require 'rails_helper'

describe 'following' do 

	let(:user_one) { User.create email: 'hello@hi.com', password: '12345678', password_confirmation: '12345678'}
	let(:user_two) {User.create email: "sup@lo.com", password: '12345678', password_confirmation: '12345678'}
	before { user_one.posts.create title: "Pretty Picture"}

	context 'another user' do 

		it 'adds them to my list of followeds', js: true do 
			login_as user_two
			visit '/'
			click_link 'Follow hello@hi.com'
			sleep 5
			expect(user_two.following_users).to include user_one


		end

	end



end