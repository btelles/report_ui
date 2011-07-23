module ReportUi
  class Engine < Rails::Engine
    STDOUT.puts File.expand_path("../../public", __FILE__)
    initializer "engine.static_assets" do |app|
      STDOUT.puts 'hello*******************'
      app.middleware.use ::ActionDispatch::Static, File.expand_path("../public", __FILE__)
    end
  end
end
