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

    redirect_to request.referer
  end

  private

  def comment_params
    params.require(:topic_comment).permit(:comment)
  end
end
