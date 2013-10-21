require 'spec_helper'

feature 'Sign up', %q{
  In order to create new user
  I am as guest
  I want to register
} do
  scenario 'Any guest be able to create account with valid credentials' do
    visit '/users/sign_up'

    within '#new_user' do
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      click_button 'Sign up'
    end

    expect(page).to have_content 'Welcome! You have signed up successfully'
    expect(User.count).to eq 1
  end
end
