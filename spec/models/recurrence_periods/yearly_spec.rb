# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecurrencePeriods::Yearly, type: :model do
  let(:today_date) { Date.new(2018, 7, 31) }
  let(:day_start) { 1 }
  let(:day_end) { 22 }
  let(:month_start) { 1 }
  let(:month_end) { 2 }

  subject {
    described_class.new(day_start:   day_start,
                        day_end:     day_end,
                        month_start: month_start,
                        month_end:   month_end)
  }

  before do
    Timecop.freeze(today_date)
  end

  after do
    Timecop.return
  end

  context 'with date_start and date_end' do
    it 'return valid date range' do
      expect(subject.next_period).to eq(Date.new(2019, month_start, day_start)..Date.new(2019, month_end, day_end))
    end

    it 'return date ranges in set interval' do
      periods = subject.periods(until: Date.new(2021, 1, 1))

      expect(periods).to eq([Date.new(2019, month_start, day_start)..Date.new(2019, month_end, day_end),
                             Date.new(2020, month_start, day_start)..Date.new(2020, month_end, day_end)])
    end
  end
end
