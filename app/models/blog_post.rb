class BlogPost < ActiveRecord::Base

  searchable do
    text :title, :content, :hash_tags
  end
end
