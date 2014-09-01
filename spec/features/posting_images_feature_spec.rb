require 'rails_helper'

describe 'posting pictures' do 

	context 'when signed in' do 

		before do
			jamie = User.create(email: "x@y.com", password: "12345678", password_confirmation: "12345678")
			login_as jamie
		end

		it 'lets you upload an image' do 
			visit '/posts/new'
			attach_file 'Image', Rails.root.join('spec/images/kitty.jpg')
			click_button 'Create Post'
			expect(page).to have_css('img.upload')
		end
	end

	context 'when signed out' do 

		it 'doesn\'t let you upload an image' do 
			visit '/posts/new'
			# click_link 'Post A Picture!'
			expect(page).to have_content 'Sign in'
     		expect(page).not_to have_field 'Title'
		end
	end
end

