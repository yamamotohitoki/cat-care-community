class Admin::CommunitiesController < ApplicationController

  def index
    @communities = Community.all
  end

  def show
    @community = Community.find(params[:id])
    @topics = @community.topics
  end

  def destroy
    @community = Community.find(params[:id])
    if @community.destroy
      flash[:notice] = "コミュニティを削除しました"
      redirect_to admin_communities_path
    else
      render 'index'
    end
  end
end
