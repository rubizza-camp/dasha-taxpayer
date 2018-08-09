FactoryBot.define do
  factory :organization do
    name Faker::Company.name
    organization_form FactoryBot.create(:organization_form)
  end
end
