class CreateOrganizationForms < ActiveRecord::Migration[5.2]
  def change
    create_table :organization_forms do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
