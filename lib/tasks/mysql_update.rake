namespace :mysql do
  desc "データベース(MySQL)のお気に入りとRTのデータを更新するタスク"
  task update_data: :environment do
    class Tweet < ApplicationRecord
      require 'twitter'

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key = TWITTER_CONSUMER_KEY
        config.consumer_secret = TWITTER_CONSUMER_SECRET
        config.access_token = TWITTER_ACCESS_TOKEN
        config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
      end


      puts "start"
      # 更新対象のデータを取得するためデータベースのtweetsテーブルより取得します。
      # ここでは更新対象を7日間のツイートとして考えます。7日間のデータはtweets.created_atで条件を指定して取得。

      tweets = Tweets.where("created_at >= ?", Date.now.weeks_ago(1))


      puts "start2"

      # 更新データはTwitterAPIから取得。
      # since_idとmax_idを取得。
      since_id = tweets.first.tweet_id
      max_id = tweets.last.tweet_id

      puts "start3"

      # タイムラインから最新のtweetを取得
      latest_tweets = @client.list_timeline("engineer", count:1000, max_id:max_id)


      puts "start4"

      tweets.each do |tweet|
        if latest_tweet.tweet_id == tweet.tweet_id
          tweet.update(favorite_count: latest_tweet.favorite_count, retweet_count: latest_tweet.retweet_count)

          puts "start5"
        end
      end
     end
     puts "start6"
  end
end