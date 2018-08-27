# frozen_string_literal: true

Given(/^test data with constraints/) do
  @activity_type = FactoryBot.create(:activity_type_with_constraints)
  @organization_form = @activity_type.organization_forms.first
  @taxation_form = @organization_form.taxation_forms.first
end

When(/^I feel survey fields/) do
  select @activity_type.name, from: 'activity_type_id'
  fill_in 'workers_number', with: 10
  check 'work_abroad'
  fill_in 'profit', with: 10_000
end

Then(/^I have activity for new organization/) do
  activity = Activity.first

  expect(activity.activity_type).to eq @activity_type
  expect(activity.organization_form).to eq @organization_form
  expect(activity.taxation_form).to eq @taxation_form
end
