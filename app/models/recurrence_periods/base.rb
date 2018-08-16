# frozen_string_literal: true

module RecurrencePeriods
  class Base < RecurrencePeriod
    def next_period
      date_start..date_end
    end

    def periods(options={})
      dates_end = recurrence_end.events(options)
      dates_end.map do |date|
        date_start_before_date(date)..date
      end
    end

    private

    def date_start
      date_start_before_date(date_end)
    end

    def date_end
      recurrence_end.next
    end

    def date_start_before_date(date)
      recurrence_start.events(until: date).last || Time.zone.today
    end

    def recurrence_start
      @recurrence_start ||= Recurrence.new(recurrence_start_params)
    end

    def recurrence_end
      @recurrence_end ||= Recurrence.new(recurrence_end_params)
    end
  end
end
