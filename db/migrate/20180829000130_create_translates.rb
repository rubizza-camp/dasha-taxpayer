class CreateTranslates < ActiveRecord::Migration[5.2]
  def change
    create_table :translates do |t|
      t.text :text
      t.string :locales
      t.integer :hint_id

      t.timestamps
    end
  end
end
