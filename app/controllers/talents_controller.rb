class TalentsController < ApplicationController
    def index
        @locations = Talent.distinct.pluck(:location).sort
        @business_units = Talent.distinct.pluck(:business_unit).sort
        @teams = Talent.distinct.pluck(:team).sort
        @sub_teams = Talent.distinct.pluck(:sub_team).sort
        @entities = Talent.distinct.pluck(:entity).sort
        @leadership = ["Leadership"]
        if params['filter'].present?
            locations = params['filter']['locations'].reject(&:blank?)
            leadearship = params['filter']['leadership'].reject(&:blank?)
            business_units = params['filter']['business_units'].reject(&:blank?)
            teams = params['filter']['teams'].reject(&:blank?)
            sub_teams = params['filter']['sub_teams'].reject(&:blank?)
            entities = params['filter']['entities'].reject(&:blank?)

            
            # query = URI.parse(request.url).query
            # query = query.gsub("%20", " ").gsub("filter=", "").split(",")
            # @talents = Talent.where(business_unit: query)
            # render partial: 'talents_list', locals: { talents: @talents }, layout: false
        else
            @talents = Talent.all
        end
    end
end
