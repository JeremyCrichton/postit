class UsersController < ApplicationController
  # Register a new users at /register
  def new
    @user = User.new
  end

  # Handle submission of new registration
  def create
    if User.create(user_params)

    else

    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end