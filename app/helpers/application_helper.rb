module ApplicationHelper

  def posted_on posted_at
    posted_at.strftime("%B %d, %Y")
  end
end
