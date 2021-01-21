class GroupsController < ApplicationController

    def index
        if @user = User.find_by_id(params[:user_id])
            @groups = @user.groups.ordered_by_create
        else
            flash[:message] = "That user doesn't exist..." if params[:user_id]
            redirect_to current_user
        end
    end

    def show
        @group = Group.find_by(params[:id])
    end

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @group = @user.groups.build
            @group.build_category
            20.times {@group.cards.build}
        else
            @group = Group.new
        end
    end

    def create
        @group = current_user.groups.build(group_params)
        if @group.save
            redirect_to user_groups_path(current_user)
        else
            @group.build_category
            20.times {@group.cards.build}
            render :new
        end
    end

    def edit
        @group = Group.find_by(params[:id])
    end

    def update
        @group = Group.find_by(params[:id])
        @group.update(group_params)
        redirect_to user_groups_path(current_user)
    end

    def destroy
        @group = Group.find_by(params[:id])
        @group.destroy

        redirect_to root_path
    end

    private

        def group_params
            params.require(:group).permit(:title, :description, :category_id, category_attributes: [:name], 
                cards_attributes: [:front, :back])
        end

end 