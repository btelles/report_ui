require 'action_controller'
module Reporter
  module Models

    module InstanceMethods
      def method_name
        @method_name ||= name.underscorize.gsub(/ /, '_')
      end
    end

    def reporter(options = {})
      include InstanceMethods
      controller = options[:controller] || "#{self.to_s}Controller"

      self.send(:cattr_accessor, :reporter_controller)
      assign_controller(controller)
      regenerate_reports
    end

    def regenerate_reports
      model_class = self
      controller_singleton = (class << self.reporter_controller; self; end)
      controller_singleton.instance_eval do
        model_class.all.each do |report|
          debugger
          define_controller_action(report)
          define_route(report)
        end
      end
    end

    def assign_controller(controller)
      begin
        self.reporter_controller= controller.constantize
      rescue
        raise "Reporter controller #{controller} for the #{self.to_s} class does not exist."
      end
    end
  end


end
