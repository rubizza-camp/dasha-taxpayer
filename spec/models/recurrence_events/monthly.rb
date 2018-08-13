# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RecurrenceEvents::Monthly, type: :model do
  before do
    Timecop.freeze(Date.new(2018, 7, 31))
  end

  after do
    Timecop.return
  end

  subject { described_class.new(date_start: date_start, date_end: date_end) }

  describe '#next_event' do

    context 'with date_start and date_end' do
      let(:date_start) { 1 }
      let(:date_end) { 22 }

      it 'return valid date range' do
        expect(subject.next_event).to eq(Date.new(2018, 8, 1)..Date.new(2018, 8, 22))
      end
    end
  end

end