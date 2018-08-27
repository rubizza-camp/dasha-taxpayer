# frozen_string_literal: true

class Tax < ApplicationRecord
  belongs_to :activity
  has_one :taxation_form, through: :activity
  has_one :organization, through: :activity

  validates :name, presence: true
end
