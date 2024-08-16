# frozen_string_literal: true

class AddIndexToTransactionRisks < ActiveRecord::Migration[7.1]
  def change
    add_index :transaction_risks, :user_id, name: "index_transaction_risks_on_user_id"
    add_index :transaction_risks, :has_cbk, name: "index_transaction_risks_on_has_cbk"
    add_index :transaction_risks, :recommendation, name: "index_transaction_risks_on_recommendation"
    add_index :transaction_risks, %i[user_id has_cbk], name: "index_transaction_risks_on_user_id_and_has_cbk"
    add_index :transaction_risks, %i[user_id transaction_date], name: "index_transaction_risks_on_user_id_and_transaction_date"
  end
end
