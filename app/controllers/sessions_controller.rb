# class SessionsController < ApplicationController

#   skip_before_action :authenticate_user!

#   def new

#   end

#   def create
#     user = User.find_by(email: params[:email])

#     if user&.authenticate(params[:password])
#       session[:user_id] = user.id
#       redirect_to cookies[:desired_path] || root_path
    
#     else
#       flash[:alert] = 'Are you a Guru? Verify your Email and Password please'
#       render :new
#     end
#   end

#   def destroy
#     cookies.delete(:desired_path)
#     session.delete(:user_id)
#     redirect_to tests_path
#   end
# end
