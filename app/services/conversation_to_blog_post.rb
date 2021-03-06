class ConversationToBlogPost
  attr_accessor :conversation, :responses

  def initialize(conversation)
    @conversation = conversation
    @responses = conversation.slack_responses
  end

  def to_blog_post
    post = BlogPost.new(
      title: title_text,
      content: combined_content,
      hash_tags: combined_hash_tags
    )
    responses.each do |response|
      post.slack_responses << response
    end
    post.save
    post
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

  def combined_hash_tags
    responses.collect(&:hash_tags).reduce(&:+)
  end

  def cleanup_content(text)
    text
  end

end
