class ApplicationController < ActionController::Base
    #gives access to methods in the views
    helper_method :current_user, :logged_in?

    private
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
            flash[:message] = "Please log into your account to view that page."
            redirect_to root_path
        end 
    end
    
    def find_user
        @user = User.find_by_id(params[:user_id])
    end

    def find_group
        @group = Group.find_by_id(params[:id])
    end
end
