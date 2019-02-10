namespace :mysql do
  desc "データベース(MySQL)にデータを登録するタスク"
  task add_data: :environment do
    class Tweet < ApplicationRecord

      require 'twitter'

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = "9mQdXvpBwT2PoBlcyCq4tG8Lm"
        config.consumer_secret     = "qRCPkoLaKpICapdVInLf5490C4PnYAgbBP0xzIQRCMtuJeehit"
        config.access_token        = "2492127391-tks07Xxw3s8kuiA6IuPGRWYUxr1eNFL7E2qWT0r"
        config.access_token_secret = "qp18SJMMw6TeIULbS0mfIwZMQTwpCla3NcPs9XsoQkKFc"
      end

      last_get_tweet_id = 1094298953418297344   #現時点では最新のtweet.idを仮に代入しているが、データベースに格納された最新tweetのidを代入できるようにしたい 
      @client.list_timeline("engineer", count:1000, since_id:last_get_tweet_id).each do |tweet| 
        unless tweet.retweet? 
          unless tweet.reply?
              Tweet.create(tweet: tweet.full_text, user_name: tweet.user.screen_name, 
                           favorite_count: tweet.favorite_count, retweet_count: tweet.retweet_count, 
                           tweet_point: tweet.favorite_count + tweet.retweet_count,
                           tweet_url: tweet.url, tweet_id: tweet.id, tweet_time: tweet.created_at)

              last_get_tweet_id = tweet.id
              puts "最後に取得したTweetのid：#{last_get_tweet_id}"  #デバッグ用
          end
        end
      end
    end
  end
end