# frozen_string_literal: true

FactoryBot.define do
  factory :organization_form do
    name { Faker::Company.type }

    trait :private_entrepreneur do
      name 'private_entrepreneur'
    end

    trait :worldwide_corparation do
      name 'worldwide_corparation'
      association :taxation_form, :monthly_fixed_price
    end
  end
end
