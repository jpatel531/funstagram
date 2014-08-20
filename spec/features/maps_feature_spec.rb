require 'rails_helper'


describe 'maps' do

	before do
		jamie = User.create(email: "x@y.com", password: "12345678", password_confirmation: "12345678")
		login_as jamie
		jamie.posts.create(title: 'Cool Post', address: '25 City Road, London')
	end

end