# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :organization_form
  has_many :activities, dependent: :destroy

  accepts_nested_attributes_for :activities, allow_destroy: true, update_only: true
end
