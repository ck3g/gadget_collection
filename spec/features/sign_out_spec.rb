require 'spec_helper'

feature 'Sign out', %q{
  In order to sign out from web app
  I am as signed in user
  I want to sign out
} do
  given!(:user) { create :user_example_com }

  scenario 'Signed in user be able to sign out' do
    sign_in_as 'user@example.com', 'password'

    click_link 'Sign out'

    expect(page).to have_content 'Signed out successfully.'
  end
end
