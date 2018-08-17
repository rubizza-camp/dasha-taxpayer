class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.references :activity_type, foreign_key: true
      t.references :taxation_form, foreign_key: true
      t.references :organization, foreign_key: true

      t.timestamps
    end
  end
end
