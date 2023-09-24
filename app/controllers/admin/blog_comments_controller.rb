class Admin::BlogCommentsController < ApplicationController

  def destroy
    @comment = BlogComment.find(params[:id])
    if @comment.destroy
       flash[:notice] = "コメントが削除されました。"
    else
       flash[:alert] = "コメントを削除できません。"
    end
    redirect_to request.referer
  end
end
