class Report < ActiveRecord::Base
  def data 
    case type
    when 'ruby'
      eval(code)
    when 'sql'
      Report.find_by_sql(code)
    end
  end
end
