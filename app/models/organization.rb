# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :organization_form
  belongs_to :taxation_form
  has_many :taxes, dependent: :destroy
  has_many :activities, dependent: :destroy
end
