# frozen_string_literal: true

FactoryBot.define do
  factory :constraint_by_profit, class: 'Constraints::Profit' do
    value Faker::Number.number(6)
  end

  factory :constraint_by_workers_number, class: 'Constraints::WorkersNumber' do
    value Faker::Number.between(1, 1000)
  end

  factory :constraint_by_work_abroad, class: 'Constraints::WorkAbroad' do
    value true
  end
end
