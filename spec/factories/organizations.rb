# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name { Faker::Company.name }
    association :organization_form

    trait :global_dominator do
      name 'Global Dominator, Inc.'
      association :organization_form, :worldwide_corparation
      association :taxation_form, :monthly_fixed_price
    end
  end
end
