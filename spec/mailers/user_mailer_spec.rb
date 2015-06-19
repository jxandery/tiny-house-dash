require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  it 'create user to test mailer' do
    user = create(:user, {
            username: 'jsmith',
            email: 'john.smith@gmail.com'})

    UserMailer.welcome_email(user).deliver_now
    email = ActionMailer::Base.deliveries.last
    expect(email.to).to include('john.smith@gmail.com')
    expect(email.body.to_s).to include('Welcome, jsmith')
  end


end
