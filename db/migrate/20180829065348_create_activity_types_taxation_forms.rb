class CreateActivityTypesTaxationForms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :activity_types, :taxation_forms
  end
end
