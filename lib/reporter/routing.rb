module Reporter #:nodoc:
  module Routing #:nodoc:
    module MapperExtensions
        def reports
          resources :reports
        end
    end
  end
end

ActionDispatch::Routing::Mapper.send :include, Reporter::Routing::MapperExtensions
