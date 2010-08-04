module Reporter
  module Controllers
    module ClassMethods
    end
  end
end
ActionController::Base.send :extend, Reporter::Controllers::ClassMethods
