# frozen_string_literal: true

class RemoveAdminTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :admins # rubocop:disable Rails/ReversibleMigration
  end
end
