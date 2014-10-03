class SlackConversationThreader
  START_TAGS = %w{#question #help}
  END_TAGS = %w{#thanks #ty #done}

  def add(response)
    if new_thread?(response)
      last_conversation.update_attributes(complete: true)
    end
    conversation.slack_responses << response
    conversation.complete = true if thread_end?(response)
    conversation.save
  end

  def thread_end?(response)
    (response.hash_tags & END_TAGS).any?
  end

  def last_response
    last_conversation.slack_responses.last
  end

  def new_thread?(response)
    (response.hash_tags & START_TAGS).any? ||
    last_response.nil? ||
    (response.timestamp - last_response.timestamp) > 2.hours
  end

  def last_conversation
    SlackConversation.last
  end

  def conversation
    unless @conversation
      last = last_conversation
      if last.nil? or last.complete?
        @conversation = SlackConversation.new
      else
        @conversation = last
      end
    end
    @conversation
  end
end
