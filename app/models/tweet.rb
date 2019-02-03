class Tweet < ApplicationRecord
  Tweet.create(tweet: "test", user_name: "test_user", favorite_count: "test_favorite", retweet_count: "test_retweet", tweet_url: "https://twitter.com/XXX/status/XXXXXXXXXXXXXXXX")
end  