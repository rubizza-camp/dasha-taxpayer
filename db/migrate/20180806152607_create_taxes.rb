class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.string :date
      t.string :name
      t.string :rate
      t.timestamps
    end
  end
end
