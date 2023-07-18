FactoryBot.define do
  factory :message do
    body { Faker::Quotes::Shakespeare.hamlet_quote }
    association :sender, factory: [:account, :as_clinician]
    association :recipient, factory: [:account, :as_patient]

    trait :as_referral do
      association :referral, factory: :referral
    end
  end
end
