class OrganizationForm < ApplicationRecord
  has_many :organizations
  has_and_belongs_to_many :activity_types
end
