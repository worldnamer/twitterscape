module HomeHelper
  def show_tweet(tweet)
    final_tweet_text = tweet.full_text
    tweet.urls.reverse.each do |url_entity|
      anchor_tag = "<a href='#{url_entity.url}' title='#{url_entity.expanded_url}' target='_blank'>link</a>"
      final_tweet_text = final_tweet_text[0, url_entity.indices[0]] + anchor_tag + final_tweet_text[url_entity.indices[1], final_tweet_text.length]
    end
    final_tweet_text
  end

  def tweet_age(tweet)
    if tweet.created_at < 20.minutes.ago
      "older"
    elsif tweet.created_at < 10.minutes.ago
      "old"
    else
      "current"
    end
  end
end
