class CreateTaxationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :taxation_forms do |t|
      t.string :name, null: false
      t.string :description
      t.references :organization_form, foreign_key: true

      t.timestamps
    end
  end
end
