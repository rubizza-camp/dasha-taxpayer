class AddTaxationFormToOrganization2 < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :taxation_form, foreign_key: true
  end
end
