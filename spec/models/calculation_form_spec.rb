# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Taxes::CalculationForm, type: :model do
  let(:fixed_rate) { build :fixed_rate }
  let(:percent_from_receipt) { build :percent_from_receipt }
  let(:percent_from_sales) { build :percent_from_sales }

  it 'is not valid without a type' do
    fixed_rate.type = nil
    percent_from_receipt.type = nil
    percent_from_sales.type = nil
    expect(fixed_rate).to_not be_valid
    expect(percent_from_receipt).to_not be_valid
    expect(percent_from_sales).to_not be_valid
  end

  it 'is valid with a type' do
    expect(fixed_rate).to be_valid
    expect(percent_from_receipt).to be_valid
    expect(percent_from_sales).to be_valid
  end
end
