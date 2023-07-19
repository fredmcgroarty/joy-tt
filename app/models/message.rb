class Message < ApplicationRecord
  belongs_to :sender, class_name: 'Account'
  belongs_to :recipient, class_name: 'Account'
  belongs_to :referral, optional: true

  validates_presence_of :body
end
