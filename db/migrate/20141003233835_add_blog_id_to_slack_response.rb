class AddBlogIdToSlackResponse < ActiveRecord::Migration
  def change
    add_column :slack_responses, :blog_post_id, :integer
  end
end
