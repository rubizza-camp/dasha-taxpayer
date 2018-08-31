class CreateHints < ActiveRecord::Migration[5.2]
  def change
    create_table :hints do |t|
      t.references :hint_owner, polymorphic: true, index: true
    end
  end
end
