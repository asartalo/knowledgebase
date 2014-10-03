class BlogPost < ActiveRecord::Base
  default_scope { order('created_at DESC') }

  searchable do
    text :title, :content, :hash_tags
  end
end
