class Account < ApplicationRecord
  belongs_to :organization, optional: true

  has_many :referrals_sent, class_name: 'Referral', foreign_key: :referer_id
  has_many :referrals_received, class_name: 'Referral', foreign_key: :referee_id

  has_many :messages_sent, class_name: 'Message', foreign_key: :sender_id
  has_many :messages_received, class_name: 'Message', foreign_key: :recipient_id

  validates :email, presence: true,
                    uniqueness: { case_sensitive: false }

  def patient?
    organization_id.nil?
  end

  def clinician?
    organization_id.present?
  end
end
