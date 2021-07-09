class Talent < ApplicationRecord

    def full_name
        return "#{first_name} #{last_name}"
    end

    def self.to_csv
        attributes = %w{
            first_name
            last_name
            location
            business_unit
            team
            sub_team
            leadership
            entity
            title
            email
            contact
            notes
        }
        CSV.generate(headers: true) do |csv|
            csv << attributes
            all.each do |talent|
                csv << attributes.map{ |attr| talent.send(attr) }
            end
        end
    end
end
