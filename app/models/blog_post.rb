class BlogPost < ActiveRecord::Base
  default_scope { order('created_at DESC') }
  has_many :slack_responses

  searchable do
    text :title, :content, :hash_tags
  end
end
