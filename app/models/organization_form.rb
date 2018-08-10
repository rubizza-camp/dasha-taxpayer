# frozen_string_literal: true

# rubocop:disable Rails/HasManyOrHasOneDependent
class OrganizationForm < ApplicationRecord
  has_many :organizations
  has_many :taxation_forms
  has_and_belongs_to_many :activity_types
end
# rubocop:enable Rails/HasManyOrHasOneDependent
