class Public::CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :create, :edit, :update, :destroy]

  def index
    @communities = Community.all
  end

  def show
   @community = Community.find(params[:id])
   @topic = Topic.new
   @topics = @community.topics
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      flash[:notice] = 'コミュニティが作成されました'
      redirect_to community_path(@community)
    else
      render :new
    end
  end

  def edit
    # コミュニティの編集フォームを表示
  end

  def update
    if @community.update(community_params)
      redirect_to @community, notice: 'コミュニティが更新されました'
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    redirect_to communities_url, notice: 'コミュニティが削除されました'
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:title, :rule, :body, :image)
  end
end
