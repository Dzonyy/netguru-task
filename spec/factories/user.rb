FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    confirmed_at { Time.now }
    password '123qwe123'
  end
end