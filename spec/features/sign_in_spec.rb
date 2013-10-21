require 'spec_helper'

feature 'Sign in', %q{
  In order to manage gadgets collection
  I am as registered user
  I want to sign in
} do
  given!(:user) { create :user_example_com }

  scenario 'User be able to sign in using valid credentials' do
    sign_in_as 'user@example.com', 'password'

    expect(page).to have_content 'Signed in successfully'
  end
end
