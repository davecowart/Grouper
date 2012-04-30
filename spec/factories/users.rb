FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name "Doe"
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    gender :m
    password "passw0rd"
    password_confirmation "passw0rd"
  end
end