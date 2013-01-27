require 'tweet_pile'

describe TweetPile do
  def tweet(created_at = Time.now)
    stub(created_at: created_at)
  end

  context 'with no data' do
    it 'should have an empty name' do
      TweetPile.new.name.should == ""
    end

    it 'should have no tweets' do
      TweetPile.new.tweets.should == []
    end
  end

  context 'when given a name and a array of tweets' do
    it 'assigns them to the members' do
      t = tweet
      pile = TweetPile.new(:worldnamer, [t])
      pile.name.should == "worldnamer"
      pile.tweets.should == [t]
    end
  end

  context 'an array of several piles' do
    it 'sorts by most recent tweet in each pile' do
      base_time = Time.now
      recent_tweet = tweet(base_time)
      older_tweet = tweet(base_time-1)
      oldest_tweet = tweet(base_time-2)

      recent_pile = TweetPile.new(:pile1, [older_tweet, recent_tweet])
      older_pile = TweetPile.new(:pile2, [older_tweet])
      oldest_pile = TweetPile.new(:pile3, [oldest_tweet])

      [oldest_pile, recent_pile, older_pile].sort.should == [recent_pile, older_pile, oldest_pile]
    end
  end
end