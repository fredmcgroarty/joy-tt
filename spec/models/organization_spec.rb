require 'rails_helper'

RSpec.describe Organization, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:clinicians) }
    it { is_expected.to have_many(:inbound_referrals) }
    it { is_expected.to have_many(:outbound_referrals) }
    it { is_expected.to have_many(:patients) }
  end
  describe 'validations' do
    context 'uniqueness' do
      subject { build(:organization, title: 'thing') }
      it { is_expected.to validate_uniqueness_of(:title).case_insensitive }
    end
    it { is_expected.to validate_presence_of(:title) }
  end


end
