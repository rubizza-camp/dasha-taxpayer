# frozen_string_literal: true

FactoryBot.define do
  factory :activity_type do
    name { Faker::Company.profession }
  end

  factory :activity_type_with_constraints, parent: :activity_type do
    after(:create) do |activity_type|
      organization_form = FactoryBot.create(:organization_form_with_constraints)
      activity_type.organization_forms << organization_form
      activity_type.taxation_forms << organization_form.taxation_forms.first
    end
  end
end
