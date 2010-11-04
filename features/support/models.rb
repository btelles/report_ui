
class Person < ActiveRecord::Base;
end

# Initializer part:

::Reporter.reportable_models = [Person]
