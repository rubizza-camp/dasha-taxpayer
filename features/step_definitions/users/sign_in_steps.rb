# frozen_string_literal: true

When(/^I click ([\w ]+)/) do |link|
  click_on(link)
end

Then(/^I see form for login/) do
  expect(page).to have_content 'Log in'
end

When(/^I sign in with valid credentials/) do
  fill_in 'Email Address', with: 'test@mail.ru'
  fill_in 'Password', with: 'password'

  click_on('Log in')
end

When(/^I see a successful sign in message/) do
  expect(page).to have_content 'Signed in successfully'
end

When(/^I sign in with unregistered email/) do
  fill_in 'Email Address', with: 'unregistered@mail.ru'
  fill_in 'Password', with: 'password'

  click_on('Log in')
end

Then(/^I see an invalid email or password message/) do
  expect(page).to have_content 'Invalid Email or password'
end
