# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group do
    user_id 1
    name "MyString"
    description "MyText"
  end
end
