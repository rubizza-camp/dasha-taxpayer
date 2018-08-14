# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe RecurrenceEvents::Monthly, type: :model do
  before { Timecop.freeze(today_date) }
  after { Timecop.return }

  subject { described_class.new(day_start: day_start, day_end: day_end) }

  context 'with date_start and date_end' do
    let(:today_date) { Date.new(2018, 7, 31) }
    let(:day_start) { 1 }
    let(:day_end) { 22 }

    it 'return valid date range' do
      expect(subject.next_event).to eq(Date.new(2018, 8, day_start)..Date.new(2018, 8, day_end))
    end

    it 'return date ranges in set interval' do
      events = subject.events(start: Date.new(2018, 8, 8), until: Date.new(2018, 11, 11))

      expect(events).to eq([Date.new(2018, 8, day_start)..Date.new(2018, 8, day_end),
                            Date.new(2018, 9, day_start)..Date.new(2018, 9, day_end),
                            Date.new(2018, 10, day_start)..Date.new(2018, 10, day_end)])
    end

    context 'when current date into the middle of the events' do
      let(:today_date) { Date.new(2018, 8, 8) }

      it 'return valid date range' do
        expect(subject.next_event).to eq(today_date..Date.new(2018, 8, day_end))
      end
    end
  end

  context 'when day_end is last day in month ' do
    let(:today_date) { Date.new(2019, 2, 1) }
    let(:day_start) { 1 }
    let(:day_end) { 31 }

    it 'return valid date range' do
      expect(subject.next_event).to eq(Date.new(2019, 2, day_start)..Date.new(2019, 2, 28))
    end

    it 'return date ranges before the set date' do
      events = subject.events(until: Date.new(2019, 5, 5))

      expect(events).to eq([Date.new(2019, 2, day_start)..Date.new(2019, 2, 28),
                            Date.new(2019, 3, day_start)..Date.new(2019, 3, 31),
                            Date.new(2019, 4, day_start)..Date.new(2019, 4, 30)])
    end
  end
end
# rubocop:enable Metrics/BlockLength
