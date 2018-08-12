# frozen_string_literal: true

module RecurrenceEvents
  class Quarterly < Monthly
    private

    def reccurence_params(day)
      yield.merge(interval: :quarterly)
    end
  end
end
