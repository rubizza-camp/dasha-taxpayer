# frozen_string_literal: true

FactoryBot.define do
  factory :monthly, class: 'RecurrenceEvents::Monthly' do
    day_start Faker::Number.between(1, 10)
    day_end Faker::Number.between(10, 20)
  end
end
