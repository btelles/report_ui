require 'action_controller'
module Reporter
  module Models

    def reporter(options = {})
      controller = options[:controller] || "#{self.to_s}Controller"

      self.send(:cattr_accessor, :reporter_controller)

      assign_controller(controller)
      regenerate_reports
    end

    def regenerate_reports
      all.each do |report|
        
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

  # The controller class to use for report actions and views

end
