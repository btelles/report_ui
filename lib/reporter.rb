
module Reporter
  mattr_accessor :reportable_models
  @@reportable_models = []
end
require 'reporter/controllers'
require 'reporter/routing'
require 'reporter/schema'
require 'reporter/orm/active_record'
require 'reporter/engine' if defined?(Rails)
