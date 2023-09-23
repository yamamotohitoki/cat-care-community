class Public::CommunitiesController < ApplicationController
  before_action :authenticate_member!, except: [:show, :index]
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  def index
    @communities = Community.page(params[:page])
  end

  def show
   @topic = Topic.new
   @topics = @community.topics
   @community = Community.find_by(params[:community_id])
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
  end

  def update
    if @community.update(community_params)
      flash[:notice] = 'コミュニティが更新されました。'
      redirect_to community_path(@community)
    else
      render :edit
    end
  end

  def destroy
    @community.destroy
    flash[:notice] = 'コミュニティが削除されました'
    redirect_to communities_path
  end

  private

  def set_community
    @community = Community.find(params[:id])
  end

  def community_params
    params.require(:community).permit(:title, :body, :image)
  end
end
