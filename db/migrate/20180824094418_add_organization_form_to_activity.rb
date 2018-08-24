class AddOrganizationFormToActivity < ActiveRecord::Migration[5.2]
  def change
    add_reference :activities, :organization_form, foreign_key: true
  end
end
