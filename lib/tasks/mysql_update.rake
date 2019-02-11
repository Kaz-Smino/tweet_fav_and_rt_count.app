namespace :mysql_update do
  desc "データベース(MySQL)に登録済のデータを更新するタスク"
  task add_data: :environment do
    class Tweet < ApplicationRecord

      require 'twitter'

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "9mQdXvpBwT2PoBlcyCq4tG8Lm"
        config.consumer_secret     = "qRCPkoLaKpICapdVInLf5490C4PnYAgbBP0xzIQRCMtuJeehit"
        config.access_token        = "2492127391-tks07Xxw3s8kuiA6IuPGRWYUxr1eNFL7E2qWT0r"
        config.access_token_secret = "qp18SJMMw6TeIULbS0mfIwZMQTwpCla3NcPs9XsoQkKFc"
      end

      last_tweet = Tweet.last #tweetsテーブルの最後のレコードを取得(つまり最新のtweetのレコード)
      last_tweet_id = last_tweet.tweet_id # tweet_idを取得

      Tweet.destroy_all

      #最新のtweetから降順で要素を取得
      @client.list_timeline("engineer", count:1000, max_id:last_tweet_id).reverse_each do |tweet|
        unless tweet.retweet? 
          unless tweet.reply?
            Tweet.create(tweet: tweet.full_text, user_name: tweet.user.screen_name, 
              favorite_count: tweet.favorite_count, retweet_count: tweet.retweet_count, 
              tweet_point: tweet.favorite_count + tweet.retweet_count,
              tweet_url: tweet.url, tweet_id: tweet.id, tweet_time: tweet.created_at)
          end
        end
      end
    end
  end
end
