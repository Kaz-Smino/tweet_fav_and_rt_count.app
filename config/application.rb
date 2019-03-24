require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

Dotenv::Railtie.load

TWITTER_CONSUMER_KEY        = ENV['TWITTER_CONSUMER_KEY']
TWITTER_CONSUMER_SECRET     = ENV['TWITTER_CONSUMER_SECRET']
TWITTER_ACCESS_TOKEN        = ENV['TWITTER_ACCESS_TOKEN']
TWITTER_ACCESS_TOKEN_SECRET = ENV['TWITTER_ACCESS_TOKEN_SECRET']

module TweetFavAndRtCount
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local 
    config.assets.compile = true
    config.assets.initialize_on_precompile = false

    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
  end
end
