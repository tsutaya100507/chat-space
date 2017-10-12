require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    config.autoload_paths += Dir[Rails.root.join('app', 'uploaders')]
    config.i18n.default_locale = :ja  #deviseの日本語化
    config.generators do |g|  #不要なファイルの生成を抑止
      g.javascripts false
      g.helper false
      g.test_framework false
    end
  end
end
