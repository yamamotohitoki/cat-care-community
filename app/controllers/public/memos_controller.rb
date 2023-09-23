class Public::MemosController < ApplicationController
  before_action :authenticate_member!

  def create
    Memo.create(memo_parameter)
    redirect_to memos_path
  end

  def destroy
    @memo = Memo.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end


  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_parameter)
      redirect_to memos_path, notice: "編集しました"
    end
  end

  private

  def blog_parameter
    params.require(:memo).permit(:title, :body, :start_time)
  end
end
