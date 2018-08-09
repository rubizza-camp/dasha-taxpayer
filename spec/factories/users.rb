# frozen_string_literal: true

# rubocop:disable Style/SymbolProc
FactoryBot.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password
    password_confirmation {|u| u.password }
  end
end
# rubocop:enable Style/SymbolProc
