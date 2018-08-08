class OrganizationForm < ApplicationRecord
  has_many :organizations
  has_many :taxation_forms
end
