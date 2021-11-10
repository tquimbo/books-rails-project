class SessionsController < ApplicationController

    def welcome 

    end
    
    def destory 
        session.delete(:user_id)
        redirect_to '/'
    end 

    def new
      @user = User.new
    end

    def create
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to users_path(@user)
          else
            flash[:error] = "Login failed: The information provided was incorrect."
            redirect_to login_path
          end
        end
    
end
