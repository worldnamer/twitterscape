require 'tweet_wrapper'

describe TweetWrapper do
  it 'forwards methods to the underlying class' do
    tweet = stub(argleblargle: "result")
    TweetWrapper.new(tweet).argleblargle.should == "result"
  end

  it 'redefines full_text' do
    t = Time.now
    url1 = stub(url: "http://t.co/link", expanded_url: "http://destination.com/link", indices: [4, 20])
    url2 = stub(url: "http://t.co/link2", expanded_url: "http://destination.com/link2", indices: [25, 42])
    tweet = stub(full_text: "abc http://t.co/link def http://t.co/link2", urls: [url1, url2], created_at: t)
    TweetWrapper.new(tweet).full_text.should == "#{t.strftime('%H:%M')} abc <a href='http://t.co/link' title='http://destination.com/link' target='_blank'>link</a> def <a href='http://t.co/link2' title='http://destination.com/link2' target='_blank'>link</a>"
  end

  context 'defining age' do
    it 'should be current when the tweet is less than ten minutes old' do
      tweet = stub(created_at: Time.now)
      wrapper = TweetWrapper.new(tweet)
      wrapper.age.should == "current"
    end
    it 'should be old when the tweet is more than ten minutes old' do
      tweet = stub(created_at: Time.now - (10*60+1))
      wrapper = TweetWrapper.new(tweet)
      wrapper.age.should == "old"
    end
    it 'should be older when the tweet is more than twenty minutes old' do
      tweet = stub(created_at: Time.now - (20*60+1))
      wrapper = TweetWrapper.new(tweet)
      wrapper.age.should == "older"
    end
  end

  it 'defines equality sensibly' do
    tweet = stub
    TweetWrapper.new(tweet).should == tweet
  end
end