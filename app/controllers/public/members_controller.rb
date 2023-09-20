class Public::MembersController < ApplicationController

  def show
     @member = Member.find_by(params[:id])
     @cats = @member.cats.all
     @blogs = @member.blogs.all
     @communities = @member.communities.all
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
      flash[:notice] = 'プロフィールが更新されました!'
      redirect_to mypage_path
    else
      render :edit
    end
  end


  private

  def member_params
    params.require(:member).permit(:profile_image, :name, :introduction)
  end

end


