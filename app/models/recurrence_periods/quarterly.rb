# frozen_string_literal: true

module RecurrencePeriods
  class Quarterly < Monthly
    private

    def recurrence_params(day)
      super.merge(interval: :quarterly)
    end
  end
end
