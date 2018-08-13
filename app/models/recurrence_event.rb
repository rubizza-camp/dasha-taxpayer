# frozen_string_literal: true

class RecurrenceEvent < ApplicationRecord
  has_one :taxation_form

  validates_numericality_of :day_start, :day_end, only_integer: true, inclusion: {in: 1..31}, allow_blank: true
  validates_numericality_of :month_start, :month_end, only_integer: true, inclusion: {in: 1..12}, allow_blank: true
end
