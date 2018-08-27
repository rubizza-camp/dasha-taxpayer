class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :type
      t.daterange :period
      t.date :date
      t.string :description
      t.string :status
      t.references :activity, foreign_key: true
      t.references :tax, foreign_key: true

      t.timestamps
    end
  end
end
