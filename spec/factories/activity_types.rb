# frozen_string_literal: true

FactoryBot.define do
  factory :activity_type do
    name { Faker::Company.profession }
  end
end
