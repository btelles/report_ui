module Reporter
  module Schema

    def reporter(options={})
      null = options[:null] || false
      default = options[:default] || ""

      apply_reporter_schema :name,     String, :null => null, :default => default, :limit => 200
      apply_reporter_schema :query,    String, :null => null, :default => default, :limit => 1000
      apply_reporter_schema :language, String, :null => null, :default => default, :limit => 20
    end
  end
end
