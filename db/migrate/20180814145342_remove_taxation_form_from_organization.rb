class RemoveTaxationFormFromOrganization < ActiveRecord::Migration[5.2]
  def change
    remove_column :organizations, :taxation_form_id, :bigint
  end
end
