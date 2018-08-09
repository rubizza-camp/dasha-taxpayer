class CreateTaxationObligations < ActiveRecord::Migration[5.2]
  def change
    create_table :taxation_obligations do |t|
      t.string :type, null: false
      t.integer :rate
      t.references :taxation_form, foreign_key: true
      t.references :activity_type, foreign_key: true

      t.timestamps
    end
  end
end
