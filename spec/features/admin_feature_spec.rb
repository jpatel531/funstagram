require 'rails_helper'

describe 'admin' do 

	context 'cannot register to be an admin' do 

		it 'won\'t be able to sign up to system' do 
			expect {visit '/admins/sign_up'}.to raise_error
		end


	end

end