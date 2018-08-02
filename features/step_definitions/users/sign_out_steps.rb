Then(/^I sign in$/) do
  visit root_path
  click_on('Login')
  fill_in 'Email Address', with: 'test@mail.ru'
  fill_in 'Password', with: '123456'
  click_on('Log in')
end

When(/^I sign out$/) do
  visit root_path
  click_on('Logout')
end

When(/^I should see a signed out message/) do
  expect(page).to have_content 'Signed out successfully'
end

When(/^I return to the site$/) do
  expect(page.current_path).to eq(root_path)
end

Then(/^I should not see link logout out$/) do
  expect(page).to have_no_link('Logout')
end