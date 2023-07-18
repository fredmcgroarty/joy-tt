class Organization < ApplicationRecord
  # I do not like the name 'clinicians' - if implemented a proper RBAC system, I would
  # not do it like this
  has_many :clinicians, class_name: 'Account', foreign_key: :organization_id
  has_many :inbound_referrals, class_name: 'Referral', foreign_key: :organization_id
  has_many :patients, through: :inbound_referrals, source: :referee
  has_many :outbound_referrals, through: :clinicians, source: :referrals_sent

  validates :title, uniqueness: {case_sensitive: false}, presence: true
end
