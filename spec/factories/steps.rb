# frozen_string_literal: true

FactoryBot.define do
  factory :step do
    description { Faker::Company.bs }
  end
end
