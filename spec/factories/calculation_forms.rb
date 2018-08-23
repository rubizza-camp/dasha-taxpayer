# frozen_string_literal: true

FactoryBot.define do
  factory :calculation_form, class: 'Taxes::CalculationForm' do
    association :activity_type
  end

  factory :fixed_rate, parent: :calculation_form, class: 'Taxes::CalculationForms::FixedRate' do
    rate 1_000_000
  end

  factory :percent_from_receipt, parent: :calculation_form, class: 'Taxes::CalculationForms::PercentFromReceipt' do
    rate 5
  end

  factory :percent_from_sales, parent: :calculation_form, class: 'Taxes::CalculationForms::PercentFromSales' do
  end
end
