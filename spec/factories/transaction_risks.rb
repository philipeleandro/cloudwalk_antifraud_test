# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_risk do
    transaction_id { 1 }
    merchant_id { 1 }
    user_id { 1 }
    card_number { "MyString" }
    transaction_date { "2024-08-14 19:50:33" }
    transaction_amount { "9.99" }
    device_id { 1 }
  end
end
