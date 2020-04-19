class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  
def show
  
end

  # Register a new users at /register
  def new
    @user = User.new
  end

  # Handle submission of new registration
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user[:id]
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update(user_params)
      flash[:notice] = "Your profile was upddated."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end