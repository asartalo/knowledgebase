class AddSlackConversationIdToSlackResponse < ActiveRecord::Migration
  def change
    add_column :slack_responses, :slack_conversation_id, :integer
  end
end
