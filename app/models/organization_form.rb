# frozen_string_literal: true

class OrganizationForm < ApplicationRecord
  has_many :organizations, dependent: :restrict_with_exception
  has_many :taxation_forms, dependent: :destroy
  has_many :constraints, dependent: :destroy
  has_many :activity, dependent: :destroy
  has_many :steps, dependent: :destroy
  has_and_belongs_to_many :activity_types
end
