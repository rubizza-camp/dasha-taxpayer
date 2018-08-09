class AddTaxationFormToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :taxation_form, foreign_key: true
  end
end
