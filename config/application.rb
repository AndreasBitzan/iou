require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Iou
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    config.secret_key_base= 'ad8d0a3fc86e091bce46a89a701c34d048ccd342048dc14b31367e60e3f598ed8a49be1fc513a76e9fb9b0fc116242b0c46ef6e9c8fdeb79f8f8d3126db383b3'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.middleware.insert_before 0, Rack::Cors do
      allow do
         origins '*'
         resource '*', :headers => :any, :methods => [:get, :patch, :put, :delete, :post, :options]
       end
    end
  end
end
