FactoryGirl.define do

factory :user do
    name                  Faker::Internet.user_name
    email                 Faker::Internet.email
    password              "00000000"
    password_confirmation "00000000"
  end
end
