class Public::BlogCommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_comment, only: [:destroy]

  def create
    blog = Blog.find(params[:blog_id])
    comment = current_member.blog_comments.new(blog_comment_params)
    comment.blog_id = blog.id
    comment.save

    if comment.save
      flash[:notice] = 'コメントが投稿されました。'
      redirect_to request.referer
    else
      flash[:alert] = 'コメントの投稿に失敗しました'
      render 'blogs/show'
    end
  end

  def destroy
    if current_member && @comment.member == current_member
      @comment.destroy
      flash[:notice] = "コメントが削除されました。"
    else
      flash[:alert] = "コメントを削除できません。"
    end
    redirect_to request.referer
  end

  private

  def set_comment
    @comment = BlogComment.find(params[:id])
  end

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end
end
