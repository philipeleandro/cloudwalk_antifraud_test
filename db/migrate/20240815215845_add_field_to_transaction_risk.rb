# frozen_string_literal: true

class AddFieldToTransactionRisk < ActiveRecord::Migration[7.1]
  def change
    rename_column :transaction_risks, :recomendation, :recommendation
  end
end
