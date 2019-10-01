class HomeController < ApplicationController
  def index
  end

  def blogs
    @blogs = Blog.all
  end
end
