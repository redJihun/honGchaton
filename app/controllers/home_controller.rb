class HomeController < ApplicationController
  def index
    @temps = Post.last(10).reverse
    @cnt = 0
  end
end
