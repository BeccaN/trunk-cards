class GroupsController < ApplicationController
    before_action :redirect_if_not_logged_in
    skip_before_action :redirect_if_not_logged_in, only: [:edit, :destroy]

    def index
        if find_user
            @groups = @user.groups.ordered_by_create
        else
            flash[:message] = "That user doesn't exist..." if params[:user_id]
            redirect_to current_user
        end
    end

    def show
        find_group
    end

    def new
        if params[:user_id] && find_user
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
        find_group
        if current_user != find_group.user 
            flash[:message] = "Sorry that doesn't belong to you..."
            redirect_to user_groups_path(current_user)
        end
    end

    def update
        find_group
        @group.update(group_params)
        redirect_to user_groups_path(current_user)
    end

    def destroy
        find_group
        if current_user != find_group.user 
            flash[:message] = "Sorry that doesn't belong to you..."
            redirect_to user_groups_path(current_user)
        else
            @group.destroy
            redirect_to user_groups_path(current_user)
        end
    end

    private

        def group_params
            params.require(:group).permit(:title, :description, :category_id, category_attributes: [:name], 
                cards_attributes: [:front, :back])
        end

end 