namespace :mysql do
  desc "データベース(MySQL)のお気に入りとRTのデータを更新するタスク"
  task update_data: :environment do
    class Tweet < ApplicationRecord
      require 'twitter'
      require 'date'

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = TWITTER_CONSUMER_KEY
        config.consumer_secret = TWITTER_CONSUMER_SECRET
        config.access_token = TWITTER_ACCESS_TOKEN
        config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
      end

      tweets = Tweet.where("created_at >= ?", Date.today.weeks_ago(1))

      since_id = tweets.first.tweet_id
      max_id = tweets.last.tweet_id

      latest_tweets = @client.list_timeline("engineer", count:1000, max_id:max_id)

      latest_tweets.each do |lt|
        @count_update_tweet = 0
        update_tweets = Tweet.find_by(tweet_id: lt.id)
        unless update_tweets.nil?
          tweet = Tweet.where(tweet_id: update_tweets.tweet_id)
          tweet.update(favorite_count: lt.favorite_count)
          tweet.update(retweet_count: lt.retweet_count)
          @count_update_tweet += 1
        end
      end
      puts "#{@count_update_tweet}件のtweet(お気に入り&RT数)が更新されました"
    end
  end
end