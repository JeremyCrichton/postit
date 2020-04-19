# @TODO Errors aren't showing on invalid registation

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
  def show

  end
  
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

  def edit
    
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was updated successfully."
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end