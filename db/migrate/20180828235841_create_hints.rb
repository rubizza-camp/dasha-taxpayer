class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.integer :entity_id
      t.string  :entity_type
    end
  end
end
