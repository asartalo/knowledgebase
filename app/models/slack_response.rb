class SlackResponse < ActiveRecord::Base
  belongs_to :slack_conversation
end
