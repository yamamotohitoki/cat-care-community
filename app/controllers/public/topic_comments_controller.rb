class Public::TopicCommentsController < ApplicationController
  before_action :authenticate_member!
  before_action :set_topic_comment, only: [:destroy]

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.topic_comments.new(comment_params)
    @comment.member = current_member

    if @comment.save
      flash[:notice] = 'コメントが投稿されました'
      redirect_to request.referer
    else
      flash[:error] = 'コメントの投稿に失敗しました'
      redirect_to request.referer
    end
  end

  def destroy
    if current_member && @comment.member == current_member
      @comment.destroy
      flash[:notice] = "コメントが削除されました。"
      redirect_to request.referer
    end
  end

  private

  def set_topic_comment
    @comment = TopicComment.find(params[:id])
  end

  def comment_params
    params.require(:topic_comment).permit(:comment)
  end
end
