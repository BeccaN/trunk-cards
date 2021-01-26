class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        if params[:search]
            @categories = Category.search(params[:search])
        else
            @categories = Category.all.ordered_by_name
        end
    end

    def show
        @category = Category.find_by_id(params[:id])
    end
end 