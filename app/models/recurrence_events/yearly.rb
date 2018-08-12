# frozen_string_literal: true

module RecurrenceEvents
  class Yearly < Base
    private

    def recurrence_start_params
      reccurence_params(month_start, day_start)
    end

    def recurrence_end_params
      reccurence_params(month_end, day_end)
    end

    def reccurence_params(month, day)
      {every: :year, on: [month, day]}
    end
  end
end
