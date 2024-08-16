# frozen_string_literal: true

class TransactionRisk < ApplicationRecord
  validates :transaction_id, :merchant_id, :user_id, :card_number, :transaction_date,
            :transaction_amount, presence: true

  DENY = "deny"
  APPROVE = "approve"

  scope :has_cbk?, ->(user_id) { where(user_id: user_id, has_cbk: true) }
  scope :by_date, lambda { |user_id, transaction_date|
                    where("transaction_date >= ? AND user_id = ?", transaction_date, user_id)
                  }
end
