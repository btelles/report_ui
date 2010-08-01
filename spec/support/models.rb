class Person < ActiveRecord::Base
end

class ReportController < ActionController::Base
end

class Report < ActiveRecord::Base
  reporter
end
