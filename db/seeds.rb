require 'factory_bot'

# Create User
puts "Creating User to manager app"
User.create!(email: "cloudwalk_test@test.com", password: "password")
puts "User created"
puts "-------------------------------------------------------------"

puts "Creating approve transaction data"
# Create TransactionRisk data
args = { transaction_id: "21320398",
         merchant_id: "29744",
         user_id: "97051",
         card_number: "434505******9116",
         transaction_date: "2019-12-01T23:16:32.812632",
         transaction_amount: "374.56",
         device_id: "285475",
         has_cbk: false,
         recommendation: "approve"}

FactoryBot.create_list(:transaction_risk, 2, args)
puts "TransactionRisk create"
puts "-------------------------------------------------------------"

puts "Creating deny transaction data"
args = { transaction_id: "21320399",
  merchant_id: "92895",
  user_id: "2708",
  card_number: "444456******4210",
  transaction_date: "2019-12-01T22:45:37.873639",
  transaction_amount: "734.87",
  device_id: "497105",
  has_cbk: true,
  recommendation: "deny"}

FactoryBot.create_list(:transaction_risk, 2, args)
puts "TransactionRisk create"