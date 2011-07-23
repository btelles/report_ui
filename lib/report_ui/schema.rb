module ReportUi
  module Schema

    def report_ui(options={})
      null = options[:null] || false
      default = options[:default] || ""

      apply_report_ui_schema :name         , String, :null => null, :default => default, :limit => 200
      apply_report_ui_schema :description  , String, :null => null, :default => default, :limit => 500
      apply_report_ui_schema :code         , String, :null => null, :default => default, :limit => 700
      apply_report_ui_schema :used_columns , String, :null => null, :default => default, :limit => 1000
      apply_report_ui_schema :includes     , String, :null => null, :default => default, :limit => 200
      apply_report_ui_schema :sorts        , String, :null => null, :default => default, :limit => 600
      apply_report_ui_schema :filters      , String, :null => null, :default => default, :limit => 600
    end
  end
end
