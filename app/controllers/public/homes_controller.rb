class Public::HomesController < ApplicationController
  def top
    @blogs = Blog.all
  end
end
