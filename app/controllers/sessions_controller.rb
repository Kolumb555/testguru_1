class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  helper_method :flash_message

  def new

  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:desired_path] || root_path
    
    else
      flash_message('Are you a Guru? Verify your Email and Password please')
      render :new
    end
  end

  def flash_message(message)
    flash[:alert] = message
  end

  def destroy
    session.delete(:user_id)
    cookies.delete(:user_id)
    redirect_to tests_path
  end
end
