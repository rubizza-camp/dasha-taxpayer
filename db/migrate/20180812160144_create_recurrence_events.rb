class CreateRecurrenceEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :recurrence_events do |t|
      t.string :type
      t.integer :day_start
      t.integer :day_end
      t.integer :month_start
      t.integer :month_end

      t.timestamps
    end
  end
end
