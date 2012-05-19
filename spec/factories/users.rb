# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:github_uid)
    name { |n| "User #{User.count}" }
  end
end
