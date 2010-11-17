
class Person < ActiveRecord::Base;
end

# Initializer part:

::ReportUi.reportable_models = [Person]
