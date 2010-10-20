module Reporter
  module Orm
    # This module contains some helpers and handle schema (migrations):
    #
    #   create_table :reports do |t|
    #     t.reporter
    #   end
    #
    module ActiveRecord
      module Schema
        include Reporter::Schema

        # Tell how to apply schema methods.
        def apply_reporter_schema(name, type, options={})
          column name, type.to_s.downcase.to_sym, options
        end
      end
    end
  end
end

#ActiveRecord::Base.extend Reporter::Models
ActiveRecord::ConnectionAdapters::Table.send :include, Reporter::Orm::ActiveRecord::Schema
ActiveRecord::ConnectionAdapters::TableDefinition.send :include, Reporter::Orm::ActiveRecord::Schema
