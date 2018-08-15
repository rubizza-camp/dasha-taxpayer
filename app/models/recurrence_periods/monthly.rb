# frozen_string_literal: true

module RecurrencePeriods
  class Monthly < Base
    private

    def recurrence_start_params
      recurrence_params(day_start)
    end

    def recurrence_end_params
      recurrence_params(day_end)
    end

    def recurrence_params(day)
      {every: :month, on: day}
    end
  end
end
