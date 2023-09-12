class Public::CatsController < ApplicationController

  def index
    @member = current_member
    @cats = @member.cats.all
    @cat = Cat.new
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




  private

  def cat_params
    params.require(:cat).permit(:name, :birthday, :sex, :introduction, :family_join_day, :weight, :ideal_weight, :image)
  end

end
