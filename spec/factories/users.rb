FactoryGirl.define do
  factory :user do
    username              { Faker::Internet.user_name }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(8)}
    current_sign_in_ip    {Faker::Internet.public_ip_v4_address}

    after(:create) do |u|
      u.password_confirmation = password
    end

    trait :admin do
      after(:create) {|user| user.add_role(:admin)}
    end
    factory :super_admin do
      after(:create) {|user| user.add_role(:super_admin)}
    end
  end
end