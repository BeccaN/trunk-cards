class SessionsController < ApplicationController
    def home
    end

    def destroy
        session.clear
        redirect_to root_path
    end

    def new
    end

    def create
        user = User.find_by(email: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            flash[:message] = "Welcome back #{user.name}!"
            redirect_to user_groups_path(user)
        else
            flash[:message] = "There was a problem logging you in, please try again..."
            redirect_to "/login"
        end
    end

    def github
        @user = User.github_omniauth(auth)
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to user_groups_path(@user)
        else 
            render :home
        end
    end

    private

        def auth
            request.env['omniauth.auth']
        end
end