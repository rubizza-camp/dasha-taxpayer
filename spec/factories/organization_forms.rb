# frozen_string_literal: true

FactoryBot.define do
  factory :organization_form do
    name { Faker::Company.type }

    trait :private_entrepreneur do
      name 'private_entrepreneur'
    end

    trait :worldwide_corparation do
      name 'worldwide_corparation'

      after(:create) do |organization_form|
        create_list(:taxation_form, 1, organization_form: organization_form)
      end
    end

    trait :worldwide_corparation1 do
      name 'worldwide_corparation1'

      after(:create) do |organization_form|
        create_list(:taxation_form, 1, organization_form: organization_form)
      end
    end
  end
end
