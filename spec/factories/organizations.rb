FactoryBot.define do
  factory :organization do
    name 'TestOrg'
    organization_form OrganizationForm.create(name: 'ИП')
  end
end
