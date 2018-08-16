class AddRecurrenceEventsToTaxationForm < ActiveRecord::Migration[5.2]
  def change
    add_reference :taxation_forms, :declaration_period, foreign_key: {to_table: :recurrence_events}
    add_reference :taxation_forms, :payment_period, foreign_key: {to_table: :recurrence_events}
  end
end
