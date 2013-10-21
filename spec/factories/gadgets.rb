# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gadget do
    sequence(:name) { |n| "Gadget ##{ n }" }
    user

    factory :invalid_gadget do
      name ""
    end
  end
end
