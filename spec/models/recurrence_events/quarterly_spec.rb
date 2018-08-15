# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecurrenceEvents::Quarterly, type: :model do
  let(:today_date) { Date.new(2018, 7, 31) }
  let(:day_start) { 1 }
  let(:day_end) { 22 }

  subject { described_class.new(day_start: day_start, day_end: day_end) }

  before do
    Timecop.freeze(today_date)
  end

  after do
    Timecop.return
  end

  it 'return valid date range' do
    expect(subject.next_event).to eq(Date.new(2018, 10, day_start)..Date.new(2018, 10, day_end))
  end

  it 'return date ranges in set interval' do
    events = subject.events(starts: Date.new(2019, 1, 1), until: Date.new(2020, 1, 1))

    expect(events).to eq([Date.new(2019, 1, day_start)..Date.new(2019, 1, day_end),
                          Date.new(2019, 4, day_start)..Date.new(2019, 4, day_end),
                          Date.new(2019, 7, day_start)..Date.new(2019, 7, day_end),
                          Date.new(2019, 10, day_start)..Date.new(2019, 10, day_end)])
  end
end
