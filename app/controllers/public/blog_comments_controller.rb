class Public::BlogCommentsController < ApplicationController

  def create
    blog = Blog.find(params[:blog_id])
    comment = current_member.blog_comments.new(blog_comment_params)
    comment.blog_id = blog.id
    comment.save

    if comment.save
      flash[:notice] = 'コメントが投稿されました。'
      redirect_to blog_path(blog)
    else
      render 'blogs/show'
    end
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
