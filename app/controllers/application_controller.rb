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
        # flash[:message] = "Please log into your account." (need to figure out a way to display this error so it actually appears/disappears when I need it)
        redirect_to '/' if !logged_in?
    end
end
