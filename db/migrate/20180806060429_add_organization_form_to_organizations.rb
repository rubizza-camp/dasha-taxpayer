# frozen_string_literal: true

class AddOrganizationFormToOrganizations < ActiveRecord::Migration[5.2]
  def change
    add_reference :organizations, :organization_form, foreign_key: true
  end
end
