class CategoriesController < ApplicationController
    before_action :redirect_if_not_logged_in

    def index
        @categories = Category.all.ordered_by_name

    end

    def show
        @category = Category.find_by_id(params[:id])
    end
end 