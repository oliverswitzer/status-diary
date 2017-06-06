require 'active_record'
require_relative './persistence/project_record'
require_relative './persistence/project_repository'


if defined? Rails
  require 'active_record/railtie'

  module Persistence
    class Engine < Rails::Engine
      initializer :add_migrations do |app|
        app.config.paths['db/migrate'] << File.join(__dir__, 'persistence', 'migrations')
      end
    end
  end
end
