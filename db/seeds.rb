require 'json'
require 'open-uri'
require 'csv'
require 'erb'

puts "seeding file"
csv_text_firms = File.read(Rails.root.join('lib', 'seeds', 'jane_street_2021.csv'))
employees = CSV.parse(csv_text_firms)

employees.drop(1).each do |employee|
    location, leadership, business_unit, team, sub_team, entity, first_name, last_name, title, contact, notes, email = employee
    
    company = Company.find_or_create_by(name: entity)

    talent = Talent.create!(
        first_name: first_name,
        last_name: last_name,
        leadership: leadership,
        location: location,
        business_unit: business_unit,
        team: team,
        sub_team: sub_team,
        entity: entity,
        title: title,
        contact: contact,
        email: email,
        notes: notes,
    )

    # JobHistory.create!(

    # )

end

puts "done seeding file"
