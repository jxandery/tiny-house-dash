require 'rails_helper'

describe 'guest registers' do
  context 'send email upon user creation' do
    it 'send email' do
      visit '/'
      click_on('Sign Up')
      save_and_open_page
      fill_in 'Email', with: 'wblack@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_on('Create User')

      expect(page).to have_content('Log Out')

    email = ActionMailer::Base.deliveries.last
    expect(email.to).to include('wblack@example.com')
    expect(email.body.to_s).to include('Welcome, wblack')
    end
  end
end
