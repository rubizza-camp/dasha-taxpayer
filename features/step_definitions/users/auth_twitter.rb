# frozen_string_literal: true

When(/^I Sign in with (.*)/) do |provider|
  click_on('Sign in with ' + provider)
end

Then(/^I see Signed in successfully through the (.*)/) do |provider|
  expect(page).to have_content 'Signed in successfully through the ' + provider
end
