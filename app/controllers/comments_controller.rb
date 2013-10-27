class CommentsController < ApplicationController
  http_basic_authenticate_with_name: "laura", password: "elephants", only: :destroy

  def create
    @post = Post.find(params[:post_id])
    @comment =
    @post.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to_post_path(@post)
  end
end


#destroy action will find the post we are looking for, locate the comment within @post.comments collection, then remove it from the database, and redirect us to the show action for the post.