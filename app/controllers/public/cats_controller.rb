class Public::CatsController < ApplicationController
  before_action :authenticate_member!, except: [:show]

  def show
    @cat = set_cat(params[:id])
    @member = @cat.member
  end

  def edit
    @cat = set_cat(params[:id])
    @member = @cat.member
  end


  def create
    @cat = current_member.cats.new(cat_params)
    @cat.save_breed(params[:cat][:breed_name])
    @member = set_member(params[:member_id])


    if @cat.save
      flash[:notice] = "猫ちゃんを登録しました"
      redirect_to cat_path(@cat)
    else
      breed_valid(@cat, params[:cat][:breed_name])
      render 'public/members/cats'
    end
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update(cat_params)
      flash[:notice] = '猫ちゃんの情報が更新されました。'
      redirect_to cat_path(@cat)
    else
      render 'edit'
    end
  end

  private

  def set_cat(cat_id)
    Cat.find(cat_id)
  end

  def set_member(member_id)
    Member.find(member_id)
  end

  def breed_valid(instance, breed_name)
    if breed_name.length == 0
      instance.errors.add(:breed_name, "1文字以上で入力してください")
    end

    if breed_name.length > 25
      instance.errors.add(:breed_name, "25文字以内で入力してください")
    end
  end



  def cat_params
    params.require(:cat).permit(:name, :birthday, :sex, :introduction, :family_join_day, :weight, :ideal_weight, :image)
  end

end