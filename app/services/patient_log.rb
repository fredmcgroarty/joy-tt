# frozen_string_literal: true

class PatientLog
  class NonPatientAccount < StandardError; end
  MessageLog = Struct.new(:body, :sender, :sent_at, :referral, keyword_init: true)
  ReferralLog = Struct.new(:created_at, :organization_source, :organization_target, keyword_init: true)

  def initialize(account)
    raise NonPatientAccount, 'Account belongs to an organization.' unless account.patient?

    @account = account
  end

  delegate :messages_received, :referrals_received, to: :@account

  def all
    messages_received.includes(referral: :organization, sender: :organization).map do |message|
      message_log(message, add_referral_log: true)
    end
  end

  def messages
    messages_received.includes(:sender).map { |message| message_log(message) }
  end

  def referrals
    referrals_received.includes(:organization, referer: :organization).map do |referral|
      referral_log(referral)
    end
  end

  private

  def message_log(message, add_referral_log: false)
    MessageLog.new.tap do |log|
      log.body = message.body
      log.sender = message.sender.email
      log.sent_at = message.created_at
      log.referral = referral_log(message.referral) if add_referral_log && message.referral
    end
  end

  def referral_log(referral)
    ReferralLog.new(
      created_at: referral.created_at,
      organization_target: referral.organization.title,
      organization_source: referral.referer.organization.title
    )
  end
end
