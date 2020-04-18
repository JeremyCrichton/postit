class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.creator = User.first

    if @post.save
        flash[:notice] = "Your post was created."
        redirect_to posts_path
      else
        # render new post template
        render :new
      end
  end

  def edit; end

  def update
    if @post.update(post_params)
        flash[:notice] = "Your post was updated."
        redirect_to post_path
      else
        render :edit
      end
  end

  private

  def post_params
    # Permit title, url, description params only
    params.require(:post).permit(:title, :url, :description, category_ids: [])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end