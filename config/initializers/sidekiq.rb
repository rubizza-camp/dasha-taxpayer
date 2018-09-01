# frozen_string_literal: true

Sidekiq::Extensions.enable_delay!

url = ENV['REDIS_SIDEKIQ_URL'] || 'redis://localhost:6379/sidekiq_test'
password = ENV['REDIS_SIDEKIQ_PASSWORD']

Sidekiq.configure_server do |config|
  config.redis = {url: url, password: password}
end

Sidekiq.configure_client do |config|
  config.redis = {url: url, password: password}
end
