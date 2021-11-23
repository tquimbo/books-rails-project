class SessionsController < ApplicationController

    def welcome 

    end
    
    def destroy 
      session.delete(:user_id)
      redirect_to '/'
    end 

    def new
      @user = User.new
    end

    def create
      if params[:provider] == 'google_oauth2'
        user = User.create_by_google_omniauth(auth)
        session[:user_id] = user.id
        redirect_to user_path(user)
      else  
        user = User.find_by(username: params[:user][:username])
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to '/'
          else
            flash[:error] = "Login failed: The information provided was incorrect."
            redirect_to login_path
          end
        end
      end

      def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

  def omniauth  
    user = User.create_by_google_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to books_path
    else
      flash[:error] = user.errors.full_messages.join(". ")
      redirect_to login_path
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end

    
