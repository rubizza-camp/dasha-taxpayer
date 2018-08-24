# frozen_string_literal: true

FactoryBot.define do
  factory :taxation_form do
    name { Faker::Company.type }
    # association :organization_form

    trait :monthly_fixed_price do
      name 'fixed_price'
      declaration_period { create(:monthly) }
      payment_period { create(:monthly) }

      after(:create) do |taxation_form|
        create_list(:fixed_rate, 1, taxation_form: taxation_form)
      end
    end
  end

  factory :taxation_form_with_constraints, parent: :taxation_form do
    name 'УСН c ограничениями'
    declaration_period { create(:monthly) }
    payment_period { create(:monthly) }

    after(:create) do |taxation_form|
      create_list(:constraint_by_profit, 1, value: 165_000, taxation_form: taxation_form)
      create_list(:constraint_by_workers_number, 1, value: 100, taxation_form: taxation_form)
      create_list(:constraint_by_work_abroad, 1, taxation_form: taxation_form)
    end
  end
end
