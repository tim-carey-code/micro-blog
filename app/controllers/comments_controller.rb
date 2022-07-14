class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :correct_user, only: [:destroy]

  def create
    @blog = find_blog

    respond_to do |format|
      if @blog.comments.create(comment_params)
        format.html { redirect_to blog_path(@blog), notice: "Comment created successfully" }
      end
    end
  end

  def destroy
    @blog = find_blog
    @comment = find_comment

    if @comment.destroy
      redirect_to blog_path(@blog)
      flash[:notice] = "Comment successfully deleted"
    else
      render blog_path(@blog)
      flash[:alert] = "Comment could not be deleted"
    end
  end

  private

  def find_blog
    @blog = Blog.find(params[:blog_id])
  end

  def find_comment
    @comment = @blog.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:message, :blog_id, :user_id, :email)
  end

  def correct_user
    find_blog
    find_comment
    unless current_user == @comment.user
      flash[:alert] = "You cannot edit or delete this comment"
      redirect_to blog_path(@blog)
    end
  end
end
