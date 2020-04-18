class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    comment_params = params.require(:comment).permit(:body)
    @comment = @post.comments.build(comment_params)
    @comment.creator = User.first # @TODO fix after implementing auth

    if @comment.save
      flash[:notice] = "Your comment was added."
      # Redirect to post's show page
      redirect_to post_path(@post)
    else
      render 'posts/show'
    end
  end
end