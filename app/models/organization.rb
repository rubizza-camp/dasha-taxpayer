# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :user
  belongs_to :organization_form
  has_one :taxation_form, through: :organization_form
  has_many :taxes, dependent: :destroy
end
