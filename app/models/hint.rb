# frozen_string_literal: true

class Hint < ApplicationRecord
  belongs_to :hint_owner, polymorphic: true
  has_many :translates, dependent: :destroy
end
