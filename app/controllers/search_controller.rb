class SearchController < ApplicationController
  def index
    search = BlogPost.search { fulltext "#{params[:search]}*" }
    @posts = search.results
  end
end