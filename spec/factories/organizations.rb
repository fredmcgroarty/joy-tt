FactoryBot.define do
  factory :organization do
    title { Faker::Company.name }

    trait :with_clinicians do
      after(:create) do |org|
        create(:account, organization: org)
      end
    end

    trait :with_inbound_referrals do
      with_clinicians

      after(:create) do |org|
        create(:referal, organization: org, referer: org.clinicians.first)
      end
    end
  end
end
