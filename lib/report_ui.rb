require File.expand_path('../report_ui/schema', __FILE__)
require File.expand_path('../report_ui/engine', __FILE__)
module ReportUi
  mattr_accessor :reportable_models
  @@reportable_models = []
end
