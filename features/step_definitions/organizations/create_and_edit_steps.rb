# frozen_string_literal: true

Given(/^test OrganizationForm, ActivityType, TaxationForm/) do
  @organization_form = FactoryBot.create(:organization_form)
  @activity_type = FactoryBot.create(:activity_type)
  @taxation_form = FactoryBot.create(:taxation_form)
end

When(/^I fill organization fields/) do
  fill_in 'Name', with: 'TestOrg'

  select @organization_form.name, from: 'organization[organization_form_id]'
end

When(/^I add activity for organization/) do
  click_on('Add activity')

  binding.pry
  select @activity_type.name, from: 'organization\[activities_attributes\]\[__organization_activities_index__\]\[activity_type_id\]'
  select @taxation_form.name, from: 'organization\[activities_attributes\]\[__organization_activities_index__\]\[taxation_form_id\]'
end

When(/^I going to edit my organization/) do
  click_on('Organizations')
  click_on("#{@organization.organization_form.name} #{@organization.name}")
  click_on('Edit')
end

Then(/^And I should see new organization info/) do
  expect(page).to have_content 'TestOrg'
  expect(page).to have_content @organization_form.name
end

Then(/^I should see only new activity for my organization/) do
  @organization.activities.size = 1

  expect(page).to have_content @activity_type.name
  expect(page).to have_content @taxation_form.name
end
