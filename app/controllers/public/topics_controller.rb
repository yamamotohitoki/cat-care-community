class Public::TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def new
    @community = Community.find(params[:community_id])
    @topic = Topic.new
  end

  def show
    # トピックの詳細を表示
  end

  def create
    @community = Community.find(params[:community_id])
    @topic = @community.topics.new(topic_params)

    if @topic.save
      flash[:notice] = 'トピックが作成されました'
      redirect_to community_topic_path(@topic, @community)
    else
      render 'communities/show'
    end
  end

  def edit
    # トピックの編集フォームを表示
  end

  def update
    if @topic.update(topic_params)
      redirect_to @topic, notice: 'トピックが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: 'トピックが削除されました'
  end

  private

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:community_id, :title, :body, :image)
    end
end


