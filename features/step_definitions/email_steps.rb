# frozen_string_literal: true

# this file generated by script/generate pickle email
#
# add email mappings in features/support/email.rb

# Clear the deliveries array, useful if your background sends email that you want to ignore
Given(/^all emails? (?:have|has) been delivered$/) do
  ActionMailer::Base.deliveries.clear
end

Given(/^(\d)+ emails? should be delivered$/) do |count|
  expect(emails.size).to eq(count.to_i)
end

When(/^(?:I|they) follow "([^"]*?)" in #{capture_email}$/) do |link, email_ref|
  visit_in_email(email(email_ref), link)
end

When(/^(?:I|they) click the first link in #{capture_email}$/) do |email_ref|
  click_first_link_in_email(email(email_ref))
end

Then(/^(\d)+ emails? should be delivered to (.*)$/) do |count, to|
  actual = emails("to: \"#{email_for(to)}\"").size
  expect(actual).to eq(count.to_i), "Expected #{count} emails but encountered #{actual} delivered to #{to}"
end

Then(/^(\d)+ emails? should be delivered with #{capture_fields}$/) do |count, fields|
  actual = emails(fields).size
  expect(actual).to eq(count.to_i), "Expected #{count} emails but encountered #{actual} to be delivered with #{fields}"
end

Then(/^#{capture_email} should be delivered to (.+)$/) do |email_ref, to|
  expect(email(email_ref, "to: \"#{email_for(to)}\"")).not_to be_nil, "Failed to find #{email_ref} delivered to: #{to}"
end

Then(/^#{capture_email} should not be delivered to (.+)$/) do |email_ref, to|
  expect(email(email_ref, "to: \"#{email_for(to)}\"")).to be_nil, "Unexpectedly found #{email_ref} delivered to: #{to}"
end

Then(/^#{capture_email} should have #{capture_fields}$/) do |email_ref, fields|
  expect(email(email_ref, fields)).not_to be_nil, "Failed to find #{fields} in #{email_ref}"
end

Then(/^#{capture_email} should contain "(.*)"$/) do |email_ref, text|
  expect(email(email_ref).body).to match(/#{text}/), "Failed to find \"#{text}\" in #{email_ref}"
end

Then(/^#{capture_email} should not contain "(.*)"$/) do |email_ref, text|
  expect(email(email_ref).body).not_to match(/#{text}/), "Unexpectedly found \"#{text}\" in #{email_ref}"
end

Then(/^#{capture_email} should link to (.+)$/) do |email_ref, page|
  expect(email(email_ref).body).to match(/#{path_to(page)}/), "Failed to find link to #{page} in #{email_ref}"
end

Then(/^show me the emails?$/) do
  save_and_open_emails
end
