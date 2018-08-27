# frozen_string_literal: true

class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :activity_type
  belongs_to :taxation_form
  belongs_to :organization
  belongs_to :organization_form
  has_many   :taxes, dependent: :destroy
end
