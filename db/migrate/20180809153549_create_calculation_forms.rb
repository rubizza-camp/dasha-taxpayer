class CreateCalculationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :calculation_forms do |t|
      t.string :type, null: false
      t.float :rate
      t.references :taxation_form, foreign_key: true
      t.references :activity_type, foreign_key: true

      t.timestamps
    end
  end
end
