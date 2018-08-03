Given(/^I have no user$/) do
  expect(User.all.size).to eq(0)
end

Then(/^I can see Singin and Login links$/) do
  expect(page).to have_link("Signin")
end

Then(/^I can see text \"([a-zA-Zа-яА-Я]+)\"$/) do |text|
  expect(page).to have_content(text)
end

When /^I go to (.+)$/ do |page_name|
  visit(path_to(page_name))
end