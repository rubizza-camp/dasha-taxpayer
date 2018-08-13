class AddRecurrenceEventsToTaxationForm < ActiveRecord::Migration[5.2]
  def change
    add_reference :taxation_forms, :declaration_event, foreign_key: {to_table: :recurrence_events}
    add_reference :taxation_forms, :payment_event, foreign_key: {to_table: :recurrence_events}
  end
end
