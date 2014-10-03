module PostHelper

  def posted_on posted_at
    posted_at.strftime("%B %d, %Y")
  end

  def post_tags tags
    tags.map do |tag|
      link_to tag, tag_path( tag.delete('#') )
    end.join(", ").html_safe
  end
end
