# frozen_string_literal: true

FactoryBot.define do
  factory :taxation_form do
    name { Faker::Company.type }
    # association :organization_form

    trait :monthly_fixed_price do
      name 'fixed_price'
      declaration_event { create(:monthly) }
      payment_event { create(:monthly) }

      after(:create) do |taxation_form|
        create_list(:fixed_rate, 1, taxation_form: taxation_form)
      end
    end
  end
end
