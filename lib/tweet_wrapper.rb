class TweetWrapper
  def initialize(tweet)
    @tweet = tweet
  end

  def method_missing(*args, &block)
    @tweet.send(*args, &block)
  end

  def full_text
    final_tweet_text = @tweet.full_text
    @tweet.urls.reverse.each do |url_entity|
      anchor_tag = "<a href='#{url_entity.url}' title='#{url_entity.expanded_url}' target='_blank'>link</a>"
      final_tweet_text = final_tweet_text[0, url_entity.indices[0]] + anchor_tag + final_tweet_text[url_entity.indices[1], final_tweet_text.length]
    end
    "#{@tweet.created_at.strftime("%H:%M")} #{final_tweet_text}"
  end

  def age
    t = Time.now
    minutes = 60
    if @tweet.created_at < (t-20*minutes)
      "older"
    elsif @tweet.created_at < (t-10*minutes)
      "old"
    else
      "current"
    end
  end

  def ==(other)
    @tweet == other
  end
end