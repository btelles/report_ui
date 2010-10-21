module Reporter
  mattr_accessor :reportable_models
  @@reportable_models = []
end
require 'reporter/controllers'
require 'reporter/routing'
require 'reporter/orm/active_record'
