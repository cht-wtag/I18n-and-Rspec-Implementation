FactoryBot.define do
  factory :user, class: User do
    name {Faker::Name.name}
    age {Faker::Number.between(20, 60)}
    email {Faker::Internet.email}
  end
end