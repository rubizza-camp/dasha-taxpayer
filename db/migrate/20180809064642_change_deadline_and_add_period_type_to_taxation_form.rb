class ChangeDeadlineAndAddPeriodTypeToTaxationForm < ActiveRecord::Migration[5.2]
  def change
    rename_column :taxation_forms, :deadline, :declaration_period_in_days
    add_column :taxation_forms, :period_type, :string
  end
end
