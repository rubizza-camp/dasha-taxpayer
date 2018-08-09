class TaxationForm < ApplicationRecord
  belongs_to :organization_form
  has_many :organizations
end
