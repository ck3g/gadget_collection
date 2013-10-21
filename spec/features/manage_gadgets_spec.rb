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

  context 'when gadges already exists' do
    given!(:gadget) { create :gadget, name: 'iPad' }

    scenario 'Guest cannot see someone gadgets' do
      visit '/gadgets'

      expect(page).to_not have_content 'iPad'
      expect(page).to have_content 'You are not authorized to access this page'
    end
  end
end