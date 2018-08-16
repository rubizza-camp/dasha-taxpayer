# frozen_string_literal: true

module RecurrencePeriods
  class Yearly < Base
    private

    def recurrence_start_params
      recurrence_params(month_start, day_start)
    end

    def recurrence_end_params
      recurrence_params(month_end, day_end)
    end

    def recurrence_params(month, day)
      {every: :year, on: [month, day]}
    end
  end
end
