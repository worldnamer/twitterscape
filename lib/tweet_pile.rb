require 'tweet_wrapper'

class TweetPile
  def initialize(name = nil, tweets = nil)
    @name = name.to_s || ""
    if tweets
      @tweets = tweets.sort { |a, b| b.created_at <=> a.created_at }.map { |tweet| TweetWrapper.new(tweet) }
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
    tweet_pile.tweets.first.created_at <=> self.tweets.first.created_at
  end
end