class Report < ActiveRecord::Base
  serialize :used_columns
  validates_presence_of :used_columns

  def available_columns
    ::Reporter.reportable_models.inject({}) do |result, model|
      result.merge(model => model.columns.inject({}) do |model_attrs, attr|
        model_attrs.merge(attr.name.to_sym => self.used_columns.include?("#{model.name}##{attr.name}"))
      end)
    end
  end

  def query
    case type
    when 'ruby'
      eval(code)
    when 'sql'
      Report.find_by_sql(code)
    end
  end


  def column_names
    used_columns.map do |full_col|
      full_col.scan(/#(.*)/).flatten[0]
    end
  end

  def data
    eval code
  end
end
