# frozen_string_literal: true

module Creator
  class TransactionRiskSerializer < ActiveModel::Serializer
    attributes :transaction_id, :recommendation
  end
end
