class Public::BlogsController < ApplicationController

  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blog = Blog.new
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @comment = BlogComment.new
  end

  def create
    @blog = current_member.blogs.new(blog_params)
    if @blog.save
      flash[:notice] = 'ブログが作成されました。'
      redirect_to blogs_path
    else
      render index
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = 'ブログが更新されました。'
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    flash[:notice] = 'ブログが削除されました。'
    redirect_to blogs_path
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    params.require(:blog).permit(:title, :body, :image, :status)
  end
end
