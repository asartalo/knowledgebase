class ConversationToBlogPost
  attr_accessor :conversation, :responses

  def initialize(conversation)
    @conversation = conversation
    @responses = conversation.slack_responses
  end

  def to_blog_post
    BlogPost.create(
      title: title_text,
      content: combined_content
    )
  end

  def title_text
    responses.first.text
  end

  def combined_content
    texts = responses.collect do |response|
      cleanup_content(response.text)
    end
    texts.join("\n\n")
  end

  def cleanup_content(text)
    text
  end

end
