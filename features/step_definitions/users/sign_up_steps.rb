# frozen_string_literal: true

# When(/^I click Login/) do
#   click_on('Login')
# end
#
# Then(/^I see form for login/) do
#   expect(page).to have_content 'Log in'
# end
#
When(/^I sign up with email and password/) do
  fill_in 'Email Address', with: 'test@mail.ru'
  fill_in 'Password', with: 'password'
  fill_in 'Confirm Password', with: 'password'

  click_on('Sign up')
end

Then(/^I should see a successful sign up message/) do
  expect(page).to have_content 'Welcome! You have signed up successfully'
end

Then(/^I should see an invalid email message/) do
  expect(page).to have_content 'Email has already been taken'
end

When(/^I sign up without a password/) do
  fill_in 'Email Address', with: 'test@mail.ru'

  click_on('Sign up')
end

Then(/^I should see a missing password message/) do
  expect(page).to have_content "Password can't be blank"
end

When(/^I sign up without short password/) do
  fill_in 'Email Address', with: 'test@mail.ru'
  fill_in 'Password', with: 'short'
  fill_in 'Confirm Password', with: 'short'

  click_on('Sign up')
end

Then(/^I should see password length message/) do
  expect(page).to have_content 'Password is too short'
end

When(/^I sign up without a confirm password/) do
  fill_in 'Email Address', with: 'test@mail.ru'
  fill_in 'Password', with: 'password'

  click_on('Sign up')
end

Then(/^I should see a missing password confirmation message/) do
  expect(page).to have_content "Password confirmation can't be blank"
end

When(/^I sign up with a mismatched password confirmation/) do
  fill_in 'Email Address', with: 'test@mail.ru'
  fill_in 'Password', with: 'password'
  fill_in 'Confirm Password', with: 'other_password'

  click_on('Sign up')
end

Then(/^I should see a mismatched password message/) do
  expect(page).to have_content "Password confirmation doesn't match Password"
end
