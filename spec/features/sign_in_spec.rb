require 'spec_helper'

feature 'Sign in', %q{
  In order to manage gadgets collection
  I am as registered user
  I want to sign in
} do
  given!(:user) { create :user_example_com }

  scenario 'User be able to sign in using valid credentials' do
    visit '/users/sign_in'

    within '#new_user' do
      fill_in 'user_email', with: 'user@example.com'
      fill_in 'user_password', with: 'password'
      click_button 'Sign in'
    end

    expect(page).to have_content 'Signed in successfully'
  end
end
