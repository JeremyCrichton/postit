# @TODO Errors aren't showing on invalid registation - new.html.erb is rendering twice, once after _errors is rendered

class UsersController < ApplicationController
  # Display registration form
  def new
    @user = User.new
  end

  # Submission of registration form
  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "Your profile was created successfully."
      session[:user_id] = @user.id
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end