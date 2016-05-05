FactoryGirl.define do
  factory :mission do
    title           { Faker::Lorem.sentence 5 }
    content         { Faker::Lorem.paragraph(5) }
    trait :done do
      done true
    end
    factory :done_mission, traits: [:done]
  end
end