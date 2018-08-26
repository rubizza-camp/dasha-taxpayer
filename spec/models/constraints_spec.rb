# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Constraints do
  subject { constraint_class.create(value: value) }

  context 'Profit' do
    let(:constraint_class) { Constraints::Profit }
    let(:value) { 15_000.55 }

    it 'return float value' do
      expect(subject.value).to eq(value)
    end

    context '#appropriate?' do
      let(:valid_value) { 10_000 }
      let(:invalid_value) { 20_000 }

      it 'return true' do
        expect(subject.appropriate?(valid_value)).to eq true
      end

      it 'return false' do
        expect(subject.appropriate?(invalid_value)).to eq false
      end
    end
  end

  context 'WorkAbroad' do
    let(:constraint_class) { Constraints::WorkAbroad }
    let(:value) { true }

    it 'return boolean value' do
      expect(subject.value).to eq(value)
    end

    context '#appropriate?' do
      let(:valid_value) { 1 }
      let(:invalid_value) { 0 }

      it 'return true' do
        expect(subject.appropriate?(valid_value)).to eq true
      end

      it 'return false' do
        expect(subject.appropriate?(invalid_value)).to eq false
      end
    end
  end

  context 'WorkersNumber' do
    let(:constraint_class) { Constraints::WorkersNumber }
    let(:value) { 20 }

    it 'return integer value' do
      expect(subject.value).to eq(value)
    end

    context '#appropriate?' do
      let(:valid_value) { 10 }
      let(:invalid_value) { 30 }

      it 'return true' do
        expect(subject.appropriate?(valid_value)).to eq true
      end

      it 'return false' do
        expect(subject.appropriate?(invalid_value)).to eq false
      end
    end
  end
end
