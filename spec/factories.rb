FactoryGirl.lint
FactoryGirl.define do
  factory :user do
    email "something@gmail.com"
    password_digest "password"
  end
end
