require 'rails_helper'

describe 'tagging posts' do 

	context 'when logged in' do 
		before do 
			jamie = User.create(email: "x@y.com", password: '12345678', password_confirmation: '12345678')
			login_as jamie
		end

		it 'adds the post to the homepage' do 
			visit '/posts/new'
			fill_in 'Title', with: 'Post'
			fill_in 'Tags', with: '#yolo, #swag'
			click_button 'Create Post'

			expect(page).to have_link '#yolo'
			expect(page).to have_link '#swag'
		end
	end

	context 'by selected tag' do 
		before do 
			Post.create(title: 'Pic1', tag_names: 'yolo')
			Post.create(title: 'Pic2', tag_names: 'swag')
		end

		it 'should filter posts' do 
			visit '/posts'
			click_link 'yolo'
			expect(page).to have_content 'Pic1'
			expect(page).not_to have_content 'Pic2'
			expect(page).to have_css('h1', 'posts tagged yolo')
		end 



	end
end