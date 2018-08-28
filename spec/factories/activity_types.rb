# frozen_string_literal: true

FactoryBot.define do
  factory :activity_type do
    name { Faker::Company.profession }
  end

  factory :activity_type_with_constraints, parent: :activity_type do
    after(:create) do |activity_type|
      activity_type.organization_forms << FactoryBot.create(:organization_form_with_constraints)
    end
  end
end
