# frozen_string_literal: true

FactoryBot.define do
  factory :taxation_form do
    name { Faker::Company.type }

    trait :monthly_fixed_price do
      name 'Единый налог'
      declaration_period { create(:monthly) }
      payment_period { create(:monthly) }

      after(:create) do |taxation_form|
        create_list(:fixed_rate, 1, taxation_form: taxation_form)
      end
    end

    trait :monthly_usn do
      name 'УСН'
      declaration_period { create(:monthly) }
      payment_period { create(:monthly) }

      after(:create) do |taxation_form|
        create_list(:percent_from_receipt, 1, taxation_form: taxation_form)
      end
    end
  end
end
