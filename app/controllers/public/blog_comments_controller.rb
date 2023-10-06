class Public::BlogCommentsController < ApplicationController
  before_action :authenticate_member!

  def create
    @blog = Blog.find(params[:blog_id])
    @comment = current_member.blog_comments.new(blog_comment_params)
    @comment.blog_id = @blog.id
    @comment.save

    # if comment.save
    #   flash[:notice] = 'コメントが投稿されました。'
    # else
    #   flash[:alert] = 'コメントの投稿に失敗しました'
    # end
  end

  def destroy
    @comment = BlogComment.find(params[:id])
    if current_member && @comment.member == current_member
      @comment.destroy
      flash[:notice] = "コメントが削除されました。"
    else
      flash[:alert] = "コメントを削除できません。"
    end
  end

  private


  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
