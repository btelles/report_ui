require 'machinist/active_record'

Report.blueprint do
  name         { "Report With Last Name Smith" }
  code         { "Person.where(:last_name => 'smith')" }
  used_columns { ['Person#last_name'] }
end

Person.blueprint do
  first_name { "Smith" }
  last_name  { "Bob" }
  date_of_birth { 10.years.ago }
end
