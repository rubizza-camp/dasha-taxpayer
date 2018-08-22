# frozen_string_literal: true

class Constraint < ApplicationRecord
  belongs_to :taxation_form
  belongs_to :organization_form
end
