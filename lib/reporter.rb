$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Reporter
  mattr_accessor :reportable_models
  @@reportable_models = []

  class ReporterEngine < Rails::Engine
    #paths.app                 = "../app"
    #paths.app.controllers     = "../app/controllers"
    #paths.app.helpers         = "../app/helpers"
    paths.app.models          = File.expand_path("../app/models", File.dirname(__FILE__))
    #paths.app.views           = "../app/views"
    #paths.lib                 = "../lib"
    #paths.lib.tasks           = "../lib/tasks"
    #paths.config              = "../config"
    #paths.config.initializers = "../config/initializers"
    #paths.config.locales      = "../config/locales"
    #paths.config.routes       = "../config/routes.rb"

    initializer "reporter_engine.add_middleware" do |app|
      app.middleware.use ReporterEngine::Middleware
      
    end
  end
end
require 'reporter/controllers'
require 'reporter/routing'
require 'reporter/schema'
require 'reporter/orm/active_record'
