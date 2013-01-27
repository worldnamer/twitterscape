require_dependency 'tweet_pile'

class HomeController < ApplicationController
  def list_friends
    friend_ids = Twitter.friend_ids.map(&:to_i)
    @friends = Twitter.users(friend_ids, method: :get)
  end

  def index
    @tweets = Rails.cache.fetch("tweets", expires_in: 2.minutes) do
      Twitter.home_timeline(count: 40, include_entities: true)
    end

    piles = @tweets.group_by(&:from_user)

    @piles = piles.map { |name, tweets| TweetPile.new(name, tweets) }.sort
  end
end
