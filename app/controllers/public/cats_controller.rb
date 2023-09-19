class Public::CatsController < ApplicationController
  before_action :set_cat, onry: [:show, :edit, :update]

  def index
    @member = current_member
    @cats = @member.cats.all
    @cat = Cat.new
  end

  def show
    @cat = Cat.find(params[:id])
  end

  def edit
  end


  def create
    @cat = current_member.cats.new(cat_params)
    @cat.save_breed(params[:cat][:breed_name])
    if @cat.save
      flash[:notice] = "猫ちゃんを登録しました"
      redirect_to mypage_path
    else
       render 'index'
    end
  end

  def update
    if @cat.update(cat_params)
      flash[:notice] = '猫ちゃんの情報が更新されました。'
      redirect_to request.referer
    else
      render 'index'
    end
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :birthday, :sex, :introduction, :family_join_day, :weight, :ideal_weight, :image)
  end

end