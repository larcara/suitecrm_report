require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SuitecrmReports
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators.assets = false
    config.generators.helper = false
    # Whitelist locales available for the application
    I18n.available_locales = [:en, :it  ]
    #   Set default locale to something other than :en
    I18n.default_locale = :it 

 end
end
