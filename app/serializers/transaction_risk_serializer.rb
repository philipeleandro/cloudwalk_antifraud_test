class TransactionRiskSerializer < ActiveModel::Serializer
  attributes :transaction_id, :recommendation
end
