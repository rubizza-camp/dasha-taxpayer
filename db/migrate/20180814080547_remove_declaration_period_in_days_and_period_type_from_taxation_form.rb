class RemoveDeclarationPeriodInDaysAndPeriodTypeFromTaxationForm < ActiveRecord::Migration[5.2]
  def change
    remove_column :taxation_forms, :declaration_period_in_days
    remove_column :taxation_forms, :period_type
  end
end
