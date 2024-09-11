require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module MytaroServer
  class Application < Rails::Application
    config.load_defaults 7.0
    config.api_only = true

    # CORS 설정 추가
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:8080', 'https://mytarot-client-dbaa1.web.app'
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :delete, :options, :head],
                 credentials: true
      end
    end
  end
end
