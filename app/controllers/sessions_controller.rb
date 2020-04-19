class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by username: params[:username]
    
    if user && user.authenticate(params[:password])
      # Save user_id in session hash
      # Ensure you only save user_id not user object - object could get big as user accumulates comments
      session[:user_id] = user.id
      flash[:notice] = "Welcome, you've logged in."
      redirect_to root_path
    else
      flash.now[:error] = "Could not log you in, please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've logged out."
    redirect_to root_path
  end
end