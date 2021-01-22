class CardsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def front
        find_group
        @cards = @group.cards
    end

    def back
        find_group
        @cards = @group.cards
    end
end 