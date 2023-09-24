class Admin::TopicCommentsController < ApplicationController

  def destroy
    @comment = TopicComment.find(params[:id])
    @comment.destroy
    flash[:notice] = "コメントが削除されました。"
    redirect_to request.referer
  end
end
