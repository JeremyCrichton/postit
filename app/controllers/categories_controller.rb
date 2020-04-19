class CategoriesController < ApplicationController
  before_action :require_user, only: [:show, :create]
  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    
    if @category.save
        flash[:notice] = "Your category was created."
        redirect_to root_path
      else
        render :new
      end
  end

  private
  # Parse the attributes we want to mass assign out of the params hash using strong parameters
  def category_params
    params.require(:category).permit(:name)
  end
end