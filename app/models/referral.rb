class Referral < ApplicationRecord
  belongs_to :referee, class_name: 'Account'
  belongs_to :referer, class_name: 'Account'
  belongs_to :organization
end
