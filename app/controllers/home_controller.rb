class HomeController < ApplicationController

  def index
    @posts = BlogPost.all
    respond_to do |format|
      format.html
    end
  end

end
