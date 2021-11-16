class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end
    
    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        redirect_to login_path if !logged_in?
    end

    def self.create_by_google_omniauth(auth)
        self.find_or_create_by(username: auth[:info][:email]) do |u|
            u.password = SecureRandom.hex
        end
    end

end
