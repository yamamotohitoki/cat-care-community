class Public::CatsController < ApplicationController
  before_action :set_cat, onry: [:show, :edit, :update]
  before_action :set_member, onry: [:show, :index]

  def index
    @cats = @member.cats.all
    @cat = Cat.new
  end

  def show
  end

  def edit
  end


  def create
    @cat = current_member.cats.new(cat_params)
    @cat.save_breed(params[:cat][:breed_name])
    if @cat.save
      flash[:notice] = "猫ちゃんを登録しました"
      redirect_to cats_path(@cat)
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
    @cat = Cat.find_by(params[:id])
  end

  def set_member
    @member = Member.find_by(params[:id])
  end



  def cat_params
    params.require(:cat).permit(:name, :birthday, :sex, :introduction, :family_join_day, :weight, :ideal_weight, :image)
  end

end