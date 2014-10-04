namespace :slack do
  desc "Convert slack responses to conversations"
  task response_to_conversations: :environment do
    SlackResponse.order(timestamp: :asc).each do |s|
      threader = SlackConversationThreader.new
      threader.add(s)
    end
  end

  desc "Convert slack conversations to blog posts"
  task conversations_to_posts: :environment do
    SlackConversation.where(complete: true).each do |c|
      ConversationToBlogPost.new(c).to_blog_post if c.slack_responses.any?
    end
  end

end
