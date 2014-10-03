class QueryHashTags

  def initialize hash_tag, relation = SlackResponse, column = 'hash_tags'
    @hash_tag = hash_tag
    @relation = relation
    @column = column
  end

  def find
    @relation.where("'#{@hash_tag}' = ANY (#{@column})")
  end
  
end