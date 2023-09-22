class Public::TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]
  before_action :set_community, only: [:show, :new, :create]

  def new
    @topic = Topic.new
  end

  def show
    @comment = TopicComment.new
    @comments = @topic.topic_comments.all
  end

  def create
    @topic = Topic.new(topic_params)

    if @topic.save
      flash[:notice] = 'トピックが作成されました'
      redirect_to community_topic_path(@community, @topic)
    else
      Rails.logger.error(@topic.errors.full_messages)
      render 'new'
    end
  end

  def edit
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

    def set_community
      @community = Community.find(params[:community_id])
    end

    def topic_params
      params.require(:topic).permit(:title, :body, :image, :community_id)
    end
end


