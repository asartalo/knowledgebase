class CreateSlackConversations < ActiveRecord::Migration
  def change
    create_table :slack_conversations do |t|
      t.boolean :complete, default: false

      t.timestamps
    end
  end
end
