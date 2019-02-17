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


      puts "start"
      # 更新対象のデータを取得するためデータベースのtweetsテーブルより取得します。
      # ここでは更新対象を7日間のツイートとして考えます。7日間のデータはtweets.created_atで条件を指定して取得。

      tweets = Tweet.where("created_at >= ?", Date.today.weeks_ago(1))

      puts "start2"

      # 更新データはTwitterAPIから取得。
      # since_idとmax_idを取得。

      #更新対象となる、既にDB登録済で最も新しいレコードのtweet_idをsince_idへ代入
      since_id = tweets.first.tweet_id

      puts since_id

      #更新対象となる、既にDB登録済で最も古いレコードのtweet_idをmax_idへ代入
      max_id = tweets.last.tweet_id

      puts max_id

      puts "start3"

      puts tweets.last.tweet_id

      # タイムラインから最新のtweetを取得
      latest_tweets = @client.list_timeline("engineer", count:1000, max_id:max_id)
      p latest_tweets

      puts "latest_tweets[3].idが#{latest_tweets[3].id}"
      puts "start4"

      puts "tweets created_at"
      # タイムラインから取得した最新のtweetからデータを取り出し、それぞれのtweet_idと、
      # データベース登録済みのtweet_idと一致した場合、データを上書きする。


      latest_tweets.each do |lt|
        puts "latest_tweetsのidが#{lt.id}です"
        update_tweets = Tweet.find_by(tweet_id: lt.id)
        unless update_tweets.nil?
          puts "latest_tweetsのfavorite_countが#{lt.favorite_count}です"
          puts "update_tweetsのidが#{update_tweets.tweet_id}です"
          tweet = Tweet.where(tweet_id: update_tweets.tweet_id)
          # tweet.update_attributes(favorite_count: lt.favorite_count, retweet_count: lt.retweet_count)
          tweet.update(favorite_count: lt.favorite_count)
          tweet.update(retweet_count: lt.retweet_count)
          puts "update_tweetは空ではありません"
        end
      end
      # # Tweet.where(tweet_id: tweet.id)

      # tweets.each do |tweet|

      #   # a = tweet.tweet_id
      #   # puts "tweet_idは#{a}です"
      #   # update_tweets = latest_tweets.select {|lt| lt.id == tweet.tweet_id}
      #   update_tweets = Tweets.find_by(tweet_id: tweet.id)
      #   puts "update_tweetsが#{update_tweets}です"
      #   puts "tweet.tweet_idが#{tweet.tweet_id}です"
      #   # puts "latest_tweetsが#{latest_tweets[5]}です"
      #   puts "update_tweets[0]が#{update_tweets[0]}です"
      #   unless update_tweets.empty?
      #     tweet.update(favorite_count: latest_tweet[0].favorite_count, retweet_count: latest_tweet[0].retweet_count)
      #     puts "update_tweetは空ではありません"
      #   end
      # end
      # # unless latest_tweets.empty?
      # # if latest_tweets.id == tweets 
      # # tweet.update_attributes = { :favorite_count = tweet.favorite_count, :retweet_count = tweet.retweet_count}
      # # puts "start5"
      # #  puts "start6"
    end
  end
end