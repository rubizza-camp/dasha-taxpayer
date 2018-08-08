# frozen_string_literal: true

# rubocop:disable Rails/HasManyOrHasOneDependent
class OrganizationForm < ApplicationRecord
  has_many :organizations
end
# rubocop:enable Rails/HasManyOrHasOneDependent
