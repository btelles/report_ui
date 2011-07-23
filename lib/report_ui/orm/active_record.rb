require 'orm_adapter/adapters/active_record'
module ReportUi
  module Orm
    # This module contains some helpers and handle schema (migrations):
    #
    #   create_table :reports do |t|
    #     t.report_ui
    #   end
    #
    module ActiveRecord

      module Schema
        include ReportUi::Schema

        # Tell how to apply schema methods.
        def apply_report_ui_schema(name, type, options={})
          column name, type.to_s.downcase.to_sym, options
        end
      end
    end
  end
end
ActiveRecord::ConnectionAdapters::Table.send :include, ReportUi::Orm::ActiveRecord::Schema
ActiveRecord::ConnectionAdapters::TableDefinition.send :include, ReportUi::Orm::ActiveRecord::Schema
