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
            redirect_to user
        else
            #possible flash error message "incorrect login data"
            #flash[:message] = "Incorrect login info, please try again."
            #need to decide where to display errors (navigation or within form?)
            redirect_to "/login"
        end
    end


end