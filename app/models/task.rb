# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :activity
  validates :status, inclusion: {in: %w[completed failed pending]}
  after_initialize :set_status

  def completed
    update(status: 'completed')
  end

  def failed
    update(status: 'failed')
  end

  def uncompleted?
    status == 'pending'
  end

  private

  def set_status
    self.status ||= 'pending'
  end
end
