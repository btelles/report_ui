
module Reporter
  mattr_accessor :reportable_models
  @@reportable_models = []
end
require 'orm_adapter'
require 'reporter/routing'
require 'reporter/schema'
require 'reporter/orm/active_record'
require 'reporter/engine' if defined?(Rails)
