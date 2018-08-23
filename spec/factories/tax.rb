# frozen_string_literal: true

FactoryBot.define do
  factory :tax do
    association :activity
    association :taxation_form, :monthly_fixed_price
    association :organization, :global_dominator

    trait :tax_usn do
      association :activity
      association :taxation_form, :monthly_fixed_price1
      association :organization, :alexey
    end
  end
end
