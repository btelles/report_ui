module Reporter
  module Controllers
    module ClassMethods
      def define_controller_action(report)
        controller_singleton = class << self; self; end
        controller_singleton.class_eval do
          define_method(report.method_name) do

          end
        end
      end
    end
  end
end
ActionController::Base.send :extend, Reporter::Controllers::ClassMethods
