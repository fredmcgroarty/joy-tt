FactoryBot.define do
  factory :account do
    email { Faker::Internet.email }

    trait :as_patient do
      organization_id { nil }
    end

    trait :as_clinician do
      association :organization
    end
  end
end
