# frozen_string_literal: true

class TransactionRiskSerializer < ActiveModel::Serializer
  attributes :transaction_id, :recommendation
end
