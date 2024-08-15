# frozen_string_literal: true

class CreateTransactionRisks < ActiveRecord::Migration[7.1]
  def change
    create_table :transaction_risks do |t|
      t.integer :transaction_id
      t.integer :merchant_id
      t.integer :user_id
      t.string :card_number
      t.datetime :transaction_date
      t.decimal :transaction_amount
      t.integer :device_id
      t.boolean :has_cbk, default: false

      t.timestamps
    end
  end
end
