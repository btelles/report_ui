module ReportUi
  class Engine < Rails::Engine
    paths.app.controllers     << "lib/app/controllers"
    paths.app.helpers         << "lib/app/helpers"
    paths.app.models          << "lib/app/models"
    paths.app.views           << "lib/app/views"
    paths.config.routes       = "lib/config/routes.rb"

    initializer "static assets" do |app|
      app.middleware.use ::ActionDispatch::Static, "#{root}/public"
    end
  end
end
