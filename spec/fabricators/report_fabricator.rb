Fabricator(:report) do
  name { "#{Faker::Company.name} #{Faker::Company.bs} Report" }
  code { "Person.where(\"last_name like '%'\")" }
  used_columns { ['Person#last_name'] }
end
