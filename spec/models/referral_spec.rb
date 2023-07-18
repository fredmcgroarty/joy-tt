require 'rails_helper'

RSpec.describe Referral, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:referee) }
    it { is_expected.to belong_to(:referer) }
    it { is_expected.to belong_to(:organization) }
  end

end
