require 'action_controller'
module Reporter
  module Models

    module InstanceMethods
      def method_name
        @method_name ||= "report_#{name.underscore.gsub(/ /, '_')}".to_sym
      end

      def regenerate_report
        define_controller_action
        #define_route
      end

      def report_data
        case language
          when 'ruby'
            eval(query)
          when 'sql'
            self.class.find_by_sql(query)
        end
      end

      private 

      def define_controller_action
        self.class.reporter_controller.define_report_action(self)
      end
    end


    def reporter(options = {})
      include InstanceMethods
      controller = options[:controller] || "#{self.to_s}Controller"

      self.send(:after_save, :regenerate_report)
      self.send(:cattr_accessor, :reporter_controller)

      assign_controller(controller)
      regenerate_reports
    end

    def regenerate_reports
      model_class = self
      controller_singleton = (class << self.reporter_controller; self; end)
      controller_singleton.instance_eval do
        model_class.all.each do |report|
          report.regenerate_report
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
