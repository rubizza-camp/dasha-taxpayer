# frozen_string_literal: true

class RecurrencePeriod < ApplicationRecord
  has_one :taxation_form, dependent: :destroy

  validates :day_start, :day_end, numericality: {only_integer: true}, inclusion: {in: 1..31}, allow_blank: true
  validates :month_start, :month_end, numericality: {only_integer: true}, inclusion: {in: 1..12}, allow_blank: true
end
