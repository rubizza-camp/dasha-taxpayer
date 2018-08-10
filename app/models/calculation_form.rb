# frozen_string_literal: true

class CalculationForm < ApplicationRecord
  belongs_to :taxation_form
  belongs_to :activity_type
end
