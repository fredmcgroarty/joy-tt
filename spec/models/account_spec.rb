require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:organization).optional(true) }
    it { is_expected.to have_many(:referrals_sent) }
    it { is_expected.to have_many(:referrals_received) }
    it { is_expected.to have_many(:messages_sent) }
    it { is_expected.to have_many(:messages_received) }
  end

  describe 'validations' do
    context 'uniqueness' do
      subject { build(:account, email: 'thing@thing.com') }
      it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    end
    it { is_expected.to validate_presence_of(:email) }
  end

  describe 'instance_methods' do
    describe '#patient?/clinician?' do
      it 'patient if the account has no organization' do
        account = build(:account, organization: nil)
        expect(account.patient?).to eq true
        expect(account.clinician?).to eq false
      end
      it 'clinician if the account has an organization' do
        account = build(:account, organization: create(:organization))
        expect(account.patient?).to eq false
        expect(account.clinician?).to eq true
      end
    end
  end
end
