# frozen_string_literal: true

class Tax < ApplicationRecord
  belongs_to :activity
  validates :name, presence: true
  validates :receipts, numericality: true
  validates :exchange_difference, numericality: true
  validates :gross_revenue, numericality: true
  validates :sum_tax, numericality: true
end
