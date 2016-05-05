FactoryGirl.define do
  factory :project do
    title           { Faker::Lorem.sentence 5 }
    description     { Faker::Lorem.paragraph(3) }
    link            { Faker::Internet.url }
    association :author, factory: :user

  end
end