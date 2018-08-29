# frozen_string_literal: true

class ActivityType < ApplicationRecord
  has_and_belongs_to_many :organization_forms
  has_many :calculation_forms, dependent: :destroy
  has_one :activity, dependent: :destroy
  has_one :hint, as: :hint_owner, dependent: :destroy
end
