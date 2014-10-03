class SlackConversation < ActiveRecord::Base
  has_many :slack_responses

  def incomplete?
    !complete?
  end

end
