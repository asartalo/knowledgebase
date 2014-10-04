class SlackResponse < ActiveRecord::Base
  belongs_to :slack_conversation
  belongs_to :blog_post
end
