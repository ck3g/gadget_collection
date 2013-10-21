# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :picture do
    gadget
    title "Awesome place"
    image { fixture_file_upload("#{Rails.root}/spec/fixtures/forest.jpg", "image/jpeg") }
  end
end
