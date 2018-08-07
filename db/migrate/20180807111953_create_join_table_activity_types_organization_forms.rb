class CreateJoinTableActivityTypesOrganizationForms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :activity_types, :organization_forms do |t|
       t.index [:activity_type_id, :organization_form_id]
       t.index [:organization_form_id, :activity_type_id]
    end
  end
end
