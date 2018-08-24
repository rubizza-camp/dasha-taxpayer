class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :event_type
      t.daterange :event_period
      t.date :event_date
      t.string :description

      t.timestamps
    end
  end
end
