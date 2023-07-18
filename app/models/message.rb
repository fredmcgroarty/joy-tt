class Message < ApplicationRecord
  belongs_to :sender, class_name: 'Account'
  belongs_to :recipient, class_name: 'Account'

  belongs_to :referral, optional: true
  # I was tempted to make this polymorphic straight off the bat, so that a message can be tied to
  # any given system event, but experience has taught me 'speculative code' can hurt you!
  # its easier to make something polymorphic after the fact than to 'un-polymorphise'

  validates_presence_of :body
end
