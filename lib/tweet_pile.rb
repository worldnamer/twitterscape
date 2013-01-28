require 'tweet_wrapper'

class TweetPile
  def initialize(name = nil, tweets = nil)
    @name = name.to_s || ""
    if tweets
      @tweets = tweets.sort_by(&:created_at).map { |tweet| TweetWrapper.new(tweet) }
    else
      @tweets = []
    end
  end

  def name
    @name
  end
  alias :to_s :name

  def tweets
    @tweets
  end

  def <=>(tweet_pile)
    tweet_pile.tweets.last.created_at <=> self.tweets.last.created_at
  end
end