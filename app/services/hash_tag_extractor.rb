module HashTagExtractor

  HASHTAG_REGEX = /\B#\w\w+/

  class << self

    def extract string
      string.scan(HASHTAG_REGEX)
    end

  end

end
