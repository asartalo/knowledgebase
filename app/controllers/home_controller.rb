class HomeController < ApplicationController

  def index
    @posts = BlogPost.order created_at: :desc
    respond_to do |format|
      format.html
    end
  end

end
