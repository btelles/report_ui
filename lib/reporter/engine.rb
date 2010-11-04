module Reporter
  class Engine < Rails::Engine
    paths.app                 = "lib/app"
    paths.app.controllers     = "lib/app/controllers"
    #paths.app.helpers         = "lib/app/helpers"
    paths.app.models          = "lib/app/models"
    paths.app.views           = "lib/app/views"
    paths.config              = "lib/config"
    #paths.config.initializers = "lib/config/initializers"
    #paths.config.locales      = "lib/config/locales"
    paths.config.routes       = "lib/config/routes.rb"

    initializer "static assets" do |app|

      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
