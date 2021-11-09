class UsersController < ApplicationController

    def index
        if !logged_in?
          redirect_if_not_logged_in
        else
          redirect_to user_path(current_user)
        end
      end

    def new 
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          render :new
        end
    end
    
    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end
    
    private
    
    def user_params
        params.require(:user).permit(:username, :password)
    end
    
    end
    