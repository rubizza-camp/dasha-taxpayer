# frozen_string_literal: true

FactoryBot.define do
  factory :monthly, class: RecurrenceEvents::Monthly do
    day_start Faker::Number.between(1, 31)
    day_end Faker::Number.between(1, 31)
  end
end
