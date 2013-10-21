require 'spec_helper'

feature 'Manage gadgets' do
  given!(:user) { create :user_example_com }

  scenario 'Signed in user be able to create new gadget' do
    sign_in_as 'user@example.com', 'password'

    visit '/gadgets/new'

    within '#new_gadget' do
      fill_in 'gadget_name', with: 'iPhone'
      click_button 'Create'
    end

    expect(page).to have_content 'Gadget created successfully'
    within '#gadgets' do
      expect(page).to have_content 'iPhone'
    end
  end
end
