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
  end

  context 'WorkAbroad' do
    let(:constraint_class) { Constraints::Profit }
    let(:value) { true }

    it 'return boolean value' do
      expect(subject.value).to eq(value)
    end
  end

  context 'WorkersNumber' do
    let(:constraint_class) { Constraints::WorkersNumber }
    let(:value) { 20 }

    it 'return integer value' do
      expect(subject.value).to eq(value)
    end
  end
end
