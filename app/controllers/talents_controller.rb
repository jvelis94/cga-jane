class TalentsController < ApplicationController
    def index
        @business_units = ["Infrastructure", "Institutional Sales & Trading", "IT & Networking", "Management", "Quantitative Research", "Technology", "Trading"]
        @teams = ["Equities", "ETFs", "Finance & Treasury", "Fixed Income & Commodities", "Intern", "Legal & Compliance", "Management", "Operations", "Options", "Software Development", "Software Engineering"]
        if params['filter'].present?
            puts params['filter']
            @talents = Talent.where(business_unit: params['filter'])
            puts @talents.count
            render partial: 'talents_list', locals: { talents: @talents }, layout: false
        else
            @talents = Talent.all
        end
    end
end
