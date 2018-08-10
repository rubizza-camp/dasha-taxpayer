# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    name Faker::Company.name
    organization_form FactoryBot.create(:organization_form)
  end
end
