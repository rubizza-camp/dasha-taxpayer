class CreateConstraints < ActiveRecord::Migration[5.2]
  def change
    create_table :constraints do |t|
      t.references :taxation_form, foreign_key: true
      t.references :organization_form, foreign_key: true
      t.string :value
      t.string :type

      t.timestamps
    end
  end
end
