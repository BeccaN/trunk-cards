class GroupsController < ApplicationController
    

    def index
        #if params[:user_id] && @user = User.find_by_id(params[:user_id]) - not necessary to check for params[:user_id] because it should always be there now, since the alternative isn't possible.
        if @user = User.find_by_id(params[:user_id])
            @groups = @user.groups
        else
            flash[:message] = "That user doesn't exist..." if params[:user_id]
            redirect_to current_user
        end
    end

    def new
        #make sure to include logic in the view that limits who the user is creating groups for (should always be current user)
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            #refresh and review what is happening here...
            @group = @user.groups.build
        else
            @group = Group.new
        end
    end

    def create
        @group = current_user.posts.build(group_params)
        if @group.save
            redirect_to user_groups_path(current_user)
        else
            render :new
        end
    end
end 