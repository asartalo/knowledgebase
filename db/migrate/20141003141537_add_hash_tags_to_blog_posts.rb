class AddHashTagsToBlogPosts < ActiveRecord::Migration
  def change
    add_column :blog_posts, :hash_tags, :text, array: true, default: []
  end
end
