# frozen_string_literal: true

Sidekiq::Extensions.enable_delay!

url = ENV['REDIS_SIDEKIQ_URL'] || 'redis://localhost:6379/sidekiq_test'

Sidekiq.configure_server do |config|
  config.redis = {url: url}
end

Sidekiq.configure_client do |config|
  config.redis = {url: url}
end
