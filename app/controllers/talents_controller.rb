class TalentsController < ApplicationController
    def index
        @locations = Talent.distinct.pluck(:location).sort
        @business_units = Talent.distinct.pluck(:business_unit).sort
        # @capital_teams = Talent.distinct.pluck(:team).sort
        @capital_teams = ["ADRs", "Equities", "ETFs", "Finance & Treasury", "Finance & Treasury", "Fixed Income & Commodities","Hardware Design",
            "Institutitonal Strategy & Business Development","Intern", "Legal & Compliance", "Market Data", "Marketing", "Operations",
            "Options", "Other", "Regulatory Capital & Risk", "Software Development", "Software Engineering", "Surveillance", "Trading Desk Operations"
        ]

        @execution_teams = ["Client Onboarding", "Equities Sales & Trading", "ETF Sales and Trading", "Finance & Treasury",
            "Fixed Income Sales & Trading", "Institutitonal Strategy & Business Development", "Legal & Compliance", "Operations",
            "Options Sales & Trading", "Other", "Software Development", "Software Engineering", "Trading Desk Operations"
        ]
        @sub_teams = Talent.distinct.pluck(:sub_team).sort
        @entities = Talent.distinct.pluck(:entity).sort
        if params['filter'].present?
            locations = params['filter']['locations'].present? ? params['filter']['locations'].reject(&:blank?) : nil
            leadership = params['filter']['leadership'].present? ? params['filter']['leadership'].reject(&:blank?) : nil
            business_units = params['filter']['business_units'].present? ? params['filter']['business_units'].reject(&:blank?) : nil
            capital_teams = params['filter']['capital_teams'].present? ? params['filter']['capital_teams'].reject(&:blank?) : nil
            execution_teams = params['filter']['execution_teams'].present? ? params['filter']['execution_teams'].reject(&:blank?) : nil
            sub_teams = params['filter']['sub_teams'].present? ? params['filter']['sub_teams'].reject(&:blank?) : nil
            entities = params['filter']['entities'].present? ? params['filter']['entities'].reject(&:blank?) : nil

            @talents = Talent.all
            @talents = @talents.where(location: locations) if locations.length > 0
            @talents = @talents.where(leadership: leadership) if leadership.length > 0
            @talents = @talents.where(business_unit: business_units) if business_units.length > 0
            @talents = @talents.where(team: capital_teams) if capital_teams.length > 0
            @talents = @talents.where(team: execution_teams) if execution_teams.length > 0
            @talents = @talents.where(sub_team: sub_teams) if sub_teams.length > 0
            @talents = @talents.where(entity: entities) if entities.length > 0
            @talent_ids = @talents.pluck(:id)
            puts @talents.count
            # query = URI.parse(request.url).query
            # query = query.gsub("%20", " ").gsub("filter=", "").split(",")
            # @talents = Talent.where(business_unit: query)
            # render partial: 'talents_list', locals: { talents: @talents }, layout: false
        else
            @talents = Talent.all
        end

        

        respond_to do |format|
            format.html
            format.js
        end
    end


    def export_csv
        @talents = Talent.all
        respond_to do |format|
            format.csv { send_data @talents.to_csv, filename: "all-talents-#{Date.today}.csv" }
            format.html { redirect_to talents_path }
        end
    end

    def export_search_to_csv
        @talents = Talent.where(id: params['talents'])
        puts @talents
        respond_to do |format|
            format.csv { send_data @talents.to_csv, filename: "filtered-talents-#{Date.today}.csv" }
        end
    end

end
