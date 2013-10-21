require 'spec_helper'

feature 'Manage gadget files' do
  given!(:user) { create :user_example_com }
  given!(:gadget) { create :gadget, user: user }

  scenario 'User be able to upload pictures to gadget' do
    sign_in_as 'user@example.com', 'password'

    visit gadget_path(gadget)

    within '#new_picture' do
      fill_in 'picture_title', with: 'Awesome place'
      attach_file 'picture_image', "#{ Rails.root }/spec/fixtures/forest.jpg"
      click_button 'Create'
    end

    expect(current_path).to eq gadget_path(gadget)
    within '#pictures' do
      expect(page).to have_content 'Awesome place'
    end
  end
end
