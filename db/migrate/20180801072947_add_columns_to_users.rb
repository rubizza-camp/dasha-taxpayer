# frozen_string_literal: true

# rubocop:disable Rails/BulkChangeTable
class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
  end
end
# rubocop:enable Rails/BulkChangeTable
