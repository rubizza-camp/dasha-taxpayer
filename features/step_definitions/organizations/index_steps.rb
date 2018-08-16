# frozen_string_literal: true

Given(/^test user/) do
  @current_user = FactoryBot.create(:user)
end

Given(/^I login as user/) do
  visit '/users/sign_in'

  fill_in 'Email Address', with: @current_user.email
  fill_in 'Password', with: @current_user.password

  click_on('Log in')
end

Given(/^I have organization/) do
  @organization = FactoryBot.create(:organization, :global_dominator, user: @current_user)
end

Then(/^I should see "([\w\s]+)"/) do |text|
  expect(page).to have_content text
end

Then(/^I should see info about my organization/) do
  expect(page).to have_content @organization.name
end

Then(/^I should see organization control buttons/) do
  expect(page).to have_link 'Show'
  expect(page).to have_link 'Edit'
  expect(page).to have_link 'Destroy'
end
