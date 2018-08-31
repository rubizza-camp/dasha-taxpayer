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

    trait :regional_corparation do
      name 'OOO'

      after(:create) do |organization_form|
        create_list(:taxation_form, 1, organization_form: organization_form)
      end
    end
  end

  factory :organization_form_with_steps, parent: :organization_form do
    after(:create) do |organization_form|
      create_list(:step, 3, organization_form: organization_form)
    end
  end

  factory :organization_form_with_constraints, parent: :organization_form_with_steps do
    after(:create) do |organization_form|
      create_list(:constraint_by_workers_number, 1, value: 100, organization_form: organization_form)
      create_list(:taxation_form_with_constraints, 1, organization_form: organization_form)
    end
  end
end
