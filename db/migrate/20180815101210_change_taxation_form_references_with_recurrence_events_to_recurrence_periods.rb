class ChangeTaxationFormReferencesWithRecurrenceEventsToRecurrencePeriods < ActiveRecord::Migration[5.2]
  def change
    remove_reference :taxation_forms, :declaration_period
    remove_reference :taxation_forms, :payment_period
    add_reference :taxation_forms, :declaration_period, foreign_key: {to_table: :recurrence_periods}
    add_reference :taxation_forms, :payment_period, foreign_key: {to_table: :recurrence_periods}
  end
end
