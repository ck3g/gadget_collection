require 'spec_helper'

feature 'Manage gadgets' do
  given!(:user) { create :user_example_com }

  scenario 'Signed in user be able to create new gadget' do
    sign_in_as 'user@example.com', 'password'

    visit '/gadgets/new'

    within '#new_gadget' do
      fill_in 'gadget_name', with: 'iPhone'
      attach_file 'gadget_image', "#{ Rails.root }/spec/fixtures/iphone.png"
      click_button 'Create'
    end

    expect(page).to have_content 'Gadget created successfully'
    within '#gadgets' do
      expect(page).to have_content 'iPhone'
    end
  end

  context 'when gadges already exists' do
    given!(:ipad) { create :gadget, name: 'iPad' }
    given!(:iphone) { create :gadget, name: 'iPhone', user: user }

    scenario 'Guest cannot see someone gadgets' do
      visit '/gadgets'

      expect(page).to_not have_content 'iPad'
      expect(page).to have_content 'You are not authorized to access this page'
    end

    scenario 'User be able to see only self gadgets' do
      sign_in_as 'user@example.com', 'password'

      visit '/gadgets'

      expect(page).to have_content 'iPhone'
      expect(page).to_not have_content 'iPad'
    end

    scenario 'User be able to edit gadget self gadget' do
      sign_in_as 'user@example.com', 'password'

      visit edit_gadget_path iphone

      within "#edit_gadget_#{ iphone.id }" do
        fill_in 'gadget_name', with: 'iPhone 5'
        click_button 'Update'
      end

      expect(page).to have_content 'Gadget updated successfully'
      within '#gadgets' do
        expect(page).to have_content 'iPhone 5'
      end
    end
  end
end
