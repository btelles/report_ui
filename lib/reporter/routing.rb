module Reporter #:nodoc:
  module Routing #:nodoc:
    module MapperExtensions
        def reports
          resources :reports do
            get :columns
          end
        end
    end
  end
end

ActionDispatch::Routing::Mapper.send :include, Reporter::Routing::MapperExtensions
