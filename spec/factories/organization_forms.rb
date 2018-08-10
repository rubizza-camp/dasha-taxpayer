# frozen_string_literal: true

FactoryBot.define do
  factory :organization_form do
    name Faker::Company.type
  end
end
