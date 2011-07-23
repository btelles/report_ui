require 'orm_adapter'
require 'report_ui/routing'
require 'report_ui/schema'
require 'report_ui/orm/active_record'
require 'report_ui/engine'
module ReportUi
  mattr_accessor :reportable_models
  @@reportable_models = []
end
