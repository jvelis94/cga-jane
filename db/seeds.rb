require 'json'
require 'open-uri'
require 'csv'
require 'erb'

puts "seeding file"
csv_text_firms = File.read(Rails.root.join('lib', 'seeds', 'jane_street_2021.csv'))
employees = CSV.parse(csv_text_firms)

employees.drop(1).each do |employee|
    # puts "#{employee[0]} #{employee[1]}"

    # location, business_unit, team, sub_team, entity, first_name, last_name, title, contact, notes, email, intern, grad_year, institution, level, course = employee
    puts employee
end

puts "done seeding file"
