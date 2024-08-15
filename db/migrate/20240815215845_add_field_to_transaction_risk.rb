class AddFieldToTransactionRisk < ActiveRecord::Migration[7.1]
  def change
    add_column :transaction_risks, :recommendation, :string
  end
end
