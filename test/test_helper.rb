# frozen_string_literal: true

require './lib/nbrb_api_currency'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

VCR.configure do |c|
  c.cassette_library_dir = "test/fixtures/vcr_cassettes"
  c.hook_into :webmock
end

# rubocop:disable Style/ClassAndModuleChildren
class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
# rubocop:enable Style/ClassAndModuleChildren
