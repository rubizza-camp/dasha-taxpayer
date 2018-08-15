# frozen_string_literal: true

class OrganizationForm < ApplicationRecord
  has_many :organizations, dependent: :restrict_with_exception
  has_one :taxation_form, dependent: :destroy
  has_and_belongs_to_many :activity_types
end
