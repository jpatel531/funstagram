require 'rails_helper'

describe 'posting pictures' do 

	context 'when signed in' do 

		it 'lets you upload an image' do 
			visit '/posts/new'
			attach_file 'Image', Rails.root.join('spec/images/kitty.jpg')
			click_button 'Create Post'
			expect(page).to have_css('img.upload')
		end
	end
end

