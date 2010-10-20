
class HeiController < ActionController::Base; end

class ReportController < ActionController::Base; end

class Person < ActiveRecord::Base; end

class Report < ActiveRecord::Base
#  reporter
end

class Hello < ActiveRecord::Base
#  set_table_name 'reports'
#  reporter :controller => "HeiController"
end
