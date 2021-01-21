class CategoriesController < ApplicationController
    def index
        @categories = Category.all.ordered_by_name

    end

    def show
        @category = Category.find_by_id(params[:id])
    end
end 