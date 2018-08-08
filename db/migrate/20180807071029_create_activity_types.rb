class CreateActivityTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :activity_types do |t|
      t.string :name, uniq:true

      t.timestamps
    end
  end
end
