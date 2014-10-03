class SlackConversationThreader
  START_TAGS = %w{#question #help}
  END_TAGS = %w{#thanks #ty #done #thank}

  def add(response)
    if new_thread?(response)
      last_conversation.update_attributes(complete: true) if last_conversation
    end
    conversation.slack_responses << response
    conversation.complete = true if thread_end?(response)
    conversation.save
    conversation
  end

  def thread_end?(response)
    (response.hash_tags & END_TAGS).any?
  end

  def last_response
    conversation.slack_responses.last if conversation
  end

  def new_thread?(response)
    (response.hash_tags & START_TAGS).any? or
    last_response.nil? or
    (response.timestamp - last_response.timestamp) > 1.hour
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
