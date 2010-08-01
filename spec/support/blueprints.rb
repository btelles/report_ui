require 'machinist/active_record'

Report.blueprint do
  name { "Report With Last Name Smith" }
  query { "People.where(:last_name => 'smith')" }
end

Person.blueprint do
  first_name { "Smith" }
  last_name  { "Bob" }
  date_of_birth { 10.years.ago }
end
