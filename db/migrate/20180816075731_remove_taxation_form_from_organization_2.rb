class RemoveTaxationFormFromOrganization2 < ActiveRecord::Migration[5.2]
  def change
    remove_reference :organizations, :taxation_form
  end
end
