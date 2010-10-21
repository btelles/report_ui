require 'machinist/active_record'

Report.blueprint do
  name         { "Report With Last Name Smith" }
  code         { "People.where(:last_name => 'smith')" }
  used_columns { ['name', 'description'] }
end

Person.blueprint do
  first_name { "Smith" }
  last_name  { "Bob" }
  date_of_birth { 10.years.ago }
end
