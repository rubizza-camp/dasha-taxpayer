# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :user
  belongs_to :organization_form
  belongs_to :taxation_form
end
