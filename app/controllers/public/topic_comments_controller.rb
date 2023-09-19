class Public::TopicCommentsController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.topic_comments.new(comment_params)
    @comment.member = current_member

    if @comment.save
      flash[:notice] = 'コメントが投稿されました'
    else
      flash[:error] = 'コメントの投稿に失敗しました'
    end
  end

  def destroy
    if current_member && @comment.member == current_member
      @comment.destroy
      flash[:notice] = "コメントが削除されました。"
    else
      flash[:error] = "コメントを削除できません。"
    end
      redirect_to @comment.topic
  end

  private

  def comment_params
    params.require(:topic_comment).permit(:comment)
  end
end
