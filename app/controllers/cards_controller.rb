class CardsController < ApplicationController
    def front
        @group = Group.find_by_id(params[:id])
        @cards = @group.cards
    end

    def back
        @group = Group.find_by_id(params[:id])
        @cards = @group.cards
    end
end 