class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            #login the user
            session[:user_id] = @user.id
            #redirect to user show page
            redirect_to @user
        else
            render :new
        end
    end

    def show
        @user = User.find_by_id(params[:id])
    end

    private

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end 