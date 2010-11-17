require 'orm_adapter'
require 'report_ui/routing'
require 'report_ui/schema'
require 'report_ui/orm/active_record'
module ReportUi
  mattr_accessor :reportable_models
  @@reportable_models = []
  require 'report_ui/engine' if defined?(Rails)
end
