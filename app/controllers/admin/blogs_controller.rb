class Admin::BlogsController < ApplicationController

  def index
    @blogs = Blog.page(params[:page])
    @total_blog_count = Blog.count
  end

  def blog_index
    @member = Member.find(params[:member_id])
    @blogs = @member.blogs
  end

  def show
    @blog = Blog.find(params[:id])
    @member = @blog.member
  end

  def destroy
    @blog = Blog.find(params[:id])
    if @blog.destroy
      flash[:notice] = "ブログを削除しました"
      redirect_to admin_blogs_path
    else
      render 'show'
    end
  end

end
