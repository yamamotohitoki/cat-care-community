class Public::SearchesController < ApplicationController

  def search
    @range = params[:range]

    if @range == "ブログ"
      @blogs = Blog.looks(params[:search], params[:word])
    else
      @communities = Community.looks(params[:search], params[:word])
    end
  end

end
