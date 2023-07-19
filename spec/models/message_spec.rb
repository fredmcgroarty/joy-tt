require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:sender) }
    it { is_expected.to belong_to(:recipient) }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end
end
