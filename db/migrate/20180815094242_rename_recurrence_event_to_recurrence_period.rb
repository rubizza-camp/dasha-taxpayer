class RenameRecurrenceEventToRecurrencePeriod < ActiveRecord::Migration[5.2]
  def change
    rename_table :recurrence_events, :recurrence_periods
  end
end
