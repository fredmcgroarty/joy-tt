require 'rails_helper'

describe PatientLog do
  let(:account) { create(:account, :as_patient) }
  let!(:message) { create(:message, recipient: account, referral: referral) }
  let!(:referral) { create(:referral, referee: account ) }

  describe 'init' do
    it 'raises an error if initalized with a clinician' do
      account = create(:account, :as_clinician)
      expect { described_class.new(account) }.to raise_error(described_class::NonPatientAccount)
    end
  end

  describe '#referrals' do
    subject(:referrals) { described_class.new(account).referrals }

    it { is_expected.to include(
      an_object_having_attributes(created_at: referral.created_at),
      an_object_having_attributes(organization_target: referral.organization.title),
      an_object_having_attributes(organization_source: referral.referer.organization.title)
    ) }

    it 'orders by most recent' do
      other_referral = create(:referral, referee: account)
      expect(subject.collect(&:created_at)).to eq [
        referral.created_at,
        other_referral.created_at
      ]
    end
  end

  describe '#messages' do
    subject(:messages) { described_class.new(account).messages }

    it { is_expected.to include(
      an_object_having_attributes(body: message.body),
      an_object_having_attributes(sender: message.sender.email),
      an_object_having_attributes(sent_at: message.created_at)
    ) }

    it 'orders by most recent' do
      other_message = create(:message, recipient: account)
      expect(subject.collect(&:sent_at)).to eq [
        message.created_at,
        other_message.created_at
      ]
    end
  end

  describe "#all" do
    subject(:all) { described_class.new(account).all }

    it 'returns messages with referrals if present' do
      create(:message, recipient: account)

      expect(all[0]).to be_a(described_class::MessageLog)
      expect(all[0].referral).to be_a(described_class::ReferralLog)

      expect(all[1]).to be_a(described_class::MessageLog)
      expect(all[1].referral).to be_nil
    end
  end
end
