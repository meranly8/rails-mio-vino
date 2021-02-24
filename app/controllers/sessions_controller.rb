class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "Invalid credentials"
      redirect_to login_path
    end
  end

  def omniauth
    user = User.create_from_omniauth(auth)
    if user.valid?
        session[:user_id] = user.id
        flash[:message] = "Logged in via Omniauth"
        redirect_to root_path
    else
        flash[:message] = user.errors.full_messages.join("")
        redirect_to login_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end
