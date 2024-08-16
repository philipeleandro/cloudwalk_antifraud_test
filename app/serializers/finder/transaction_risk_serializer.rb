# frozen_string_literal: true

module Finder
  class TransactionRiskSerializer < ActiveModel::Serializer
    attributes :transaction_id, :merchant_id, :user_id, :card_number, :transaction_date,
               :transaction_amount, :device_id, :has_cbk, :recommendation
  end
end
