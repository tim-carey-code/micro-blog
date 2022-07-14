module BlogsHelper
  def find_comment
    Comment.where(user_id: current_user.id, blog_id: params[:blog_id])
  end
end
