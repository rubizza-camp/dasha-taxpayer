Given(/^I have no user$/) do
  expect(User.all.size).to eq(0)
end

When(/^I visit home page$/) do
  # require "pry"; binding.pry
  visit('/')
end

Then(/^I can see Singin and Login links$/) do
  expect(page).to have_link("Signin")
end

Then(/^I can see text (\w+)$/) do |text|
  expect(page).to have_content(text)
end
