# frozen_string_literal: true

Given(/^test OrganizationForm, ActivityType, TaxationForm/) do
  @organization_form = FactoryBot.create(:organization_form)
  @activity_type = FactoryBot.create(:activity_type)
  @taxation_form = FactoryBot.create(:taxation_form)
end

When(/^I fill organization fields/) do
  fill_in 'Name', with: 'TestOrg'

  select @organization_form.name, from: 'organization_organization_form_id'
end

When(/^I add first activity for organization/) do
  find('#organization_activities_attributes_0_activity_type_id').select(@activity_type.name)
  find('#organization_activities_attributes_0_taxation_form_id').select(@taxation_form.name)
end

When(/^I add second activity for organization/) do
  find('#organization_activities_attributes_1_activity_type_id').select(@activity_type.name)
  find('#organization_activities_attributes_1_taxation_form_id').select(@taxation_form.name)
end

When(/^I going to edit my organization/) do
  click_on('Organizations')
  click_on("#{@organization.organization_form.name} #{@organization.name}")
  find('#edit_organization').click
end

Then(/^I should behold new organization info/) do
  expect(page).to have_content 'TestOrg'
  expect(page).to have_content @organization_form.name
end

Then(/^I should behold only new activity for my organization/) do
  expect(page).to have_content @activity_type.name
  expect(page).to have_content @taxation_form.name
end
