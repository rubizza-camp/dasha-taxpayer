class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.string :name
      t.references :activity, foreign_key: true
      t.float :receipts
      t.float :exchange_difference
      t.float :gross_revenue
      t.float :sum_tax
    end
  end
end
