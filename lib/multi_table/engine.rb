# frozen_string_literal: true

module MultiTable
  # MultiTable's Rails engine definition
  class Engine < ::Rails::Engine
    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
