class Admin::TopicsController < ApplicationController

  def show
    @community = Community.find(params[:community_id])
    @topic = Topic.find(params[:id])
    @comments = @topic.topic_comments.all
  end

  def destroy
    @community = Community.find(params[:community_id])
    @topic = @community.topics.find(params[:id])
    @topic.destroy
    flash[:notich] = "トピックを削除しました"
    redirect_to admin_community_path(@community)
  end
end
