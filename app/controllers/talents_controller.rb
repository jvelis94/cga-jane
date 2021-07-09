class TalentsController < ApplicationController
    def index
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
