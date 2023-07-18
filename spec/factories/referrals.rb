FactoryBot.define do
  factory :referral do
    association :referee, factory: [:account, :as_patient]
    association :referer, factory: [:account, :as_clinician]
    organization
  end
end
