module Reporter
  module Schema

    def reporter(options={})
      null = options[:null] || false
      default = options[:default] || ""

      apply_reporter_schema :name         , String, :null => null, :default => default, :limit => 200
      apply_reporter_schema :description  , String, :null => null, :default => default, :limit => 500
      apply_reporter_schema :code         , String, :null => null, :default => default, :limit => 700
      apply_reporter_schema :used_columns , String, :null => null, :default => default, :limit => 1000
      apply_reporter_schema :includes     , String, :null => null, :default => default, :limit => 200
      apply_reporter_schema :sorts        , String, :null => null, :default => default, :limit => 600
      apply_reporter_schema :filters      , String, :null => null, :default => default, :limit => 600
    end
  end
end
