require 'rails_helper'

describe 'liking posts' do
	before do 
		Post.create
	end

	it 'is initially at 0 likes' do 
		visit '/posts'
		expect(page).to have_link '♥ 0'
	end

	it 'can be liked, incrementing the like count' do 
		visit '/posts'
		click_link '♥ 0'
		expect(page).to have_link '♥ 1'
	end

end
