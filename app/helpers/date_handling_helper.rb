# frozen_string_literal: true

module DateHandlingHelper
  def self.dates_for_two_days(day_start, day_end)
    month_today = fetch_today_month
    year_today = fetch_today_year
    date_start = Date.parse("#{year_today}.#{month_today}.#{day_start}")
    date_end   = Date.parse("#{year_today}.#{month_today}.#{day_end}")
    date_start..date_end
  end

  def self.fetch_today_month
    Time.zone.today.month
  end

  def self.fetch_today_year
    Time.zone.today.year
  end
end
