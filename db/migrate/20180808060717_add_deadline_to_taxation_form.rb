class AddDeadlineToTaxationForm < ActiveRecord::Migration[5.2]
  def change
    add_column :taxation_forms, :deadline, :integer
  end
end
