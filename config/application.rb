# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DashaTaxpayer
  # sample comment for reek
  # This method smells of :reek:UncommunicativeVariableName
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.autoload_paths += [Rails.root.join('models', 'taxes', '*.rb')]
    config.autoload_paths += [Rails.root.join('taxes', 'calculation_forms', '*.rb')]
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.generators do |g|
      g.test_framework :rspec, fixture: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    config.active_record.belongs_to_required_by_default = false
    #config.action_controller.default_protect_from_forgery = false
  end
end
