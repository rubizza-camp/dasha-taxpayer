# frozen_string_literal: true

Given(/^I have payment task/) do
  @activity = FactoryBot.create(:activity, user: @current_user)
  @task = FactoryBot.create(:payment_task, activity: @activity)
end

Then(/^I should see info about my task/) do
  expect(page).to have_content @task.type.demodulize
  expect(page).to have_content @task.date
end

Then(/^I have completed payment task/) do
  expect(@activity.tasks.first.status).to eq 'completed'
end

Then(/^I have failed payment task/) do
  expect(@activity.tasks.first.status).to eq 'failed'
end

When(/^I completed task/) do
  find(:xpath, "//input[contains(@value, 'V')]").click
end

When(/^I canceled task/) do
  find(:xpath, "//input[contains(@value, 'X')]").click
end
