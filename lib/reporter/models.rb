module Reporter
  ReportableModels = []

  module Models
    def reportable
      ::Reporter::ReportableModels << self
    end
  end
end
::ActiveRecord::Base.extend Reporter::Models
