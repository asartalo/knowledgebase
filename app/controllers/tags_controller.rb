class TagsController < ApplicationController
  before_action :hash_tag

  def show
    @posts = QueryHashTags.new(hash_tag, BlogPost).find
  end

  private
    def hash_tag
      "##{params[:id]}"
    end
end