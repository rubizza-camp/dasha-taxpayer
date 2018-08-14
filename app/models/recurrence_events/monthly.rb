# frozen_string_literal: true

module RecurrenceEvents
  class Monthly < Base
    private

    def recurrence_start_params
      reccurence_params(day_start)
    end

    def recurrence_end_params
      reccurence_params(day_end)
    end

    def reccurence_params(day)
      {every: :month, on: day}
    end
  end
end
