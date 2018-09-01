# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :activity
  validates :status, inclusion: {in: %w[completed failed pending]}
  validate :can_change_date
  after_initialize :set_status

  def uncompleted?
    status == 'pending'
  end

  private

  def can_change_date
    if date > period.last
      errors.add(:date)
    elsif date < period.first
      errors.add(:date)
    end
  end

  def set_status
    self.status ||= 'pending'
  end
end
