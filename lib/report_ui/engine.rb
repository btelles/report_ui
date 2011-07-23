module ReportUi
  class Engine < Rails::Engine
    initializer "sprockets.set_configs", :after => "action_controller.set_configs" do |app|
      app.config.assets.enabled= true
      ActiveSupport.on_load(:action_controller) do
        self.use_sprockets = app.config.assets.enabled
      end
    end
  end
end
