require 'rails_helper'

describe 'orders page' do 
	let(:post) {Post.new title: 'Pretty Picture'}
	let(:user) {User.new email: 'hello@hi.com', password: '12345678', password_confirmation: '12345678'}
	let(:admin) {Admin.new email: 'bla@bla.com', password: '12345678', password_confirmation: '12345678'}

	context 'logged in as admin' do 
		before { login_as admin, scope: :admin}

		context 'no orders' do 
			it 'sees a message saying no orders' do 
				visit '/orders'
				expect(page).to have_content 'No orders yet'
			end
		end

		context 'an order' do 
			before do
				Order.create post: post, user: user 
				visit '/orders'
			end

			it 'should display title of post and customer\'s email' do 
				expect(page).to have_content 'Pretty Picture'
				expect(page).to have_content 'hello@hi.com'
			end
		end
	end

	context 'not logged in as admin' do 
		it 'displays a prompt to sign in' do 
			visit '/orders'
			expect(page).to have_content 'Sign in'
		end
	end

	describe 'should send an email upon ordering' do 
		before do
			clear_emails
		end

		it 'should send the email' do 
			Order.create(post: post, user: user)
			open_email('hello@hi.com')
			expect(current_email).to have_content	'Order successful!'
		end
	end
	
end

