class Public::MembersController < ApplicationController

  def show
     @member = Member.find(params[:id])
  end

  def index
    @member = Member.find(params[:id])
    @cat = @member.cat.all
  end
  
  def create
    @blog = current_member.blogs.new(blog_params)
  end 

  def edit
     @member = current_member
     @cats = @member.cats.all
  end

  def update
    @member = current_member
    if @member.update(member_params)
      redirect_to mypage_path, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end


  private

  def member_params
    params.require(:member).permit(:header_image, :profile_image, :name, :introduction)
  end

end


