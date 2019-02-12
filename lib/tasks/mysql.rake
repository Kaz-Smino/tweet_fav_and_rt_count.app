namespace :mysql do
  desc "データベース(MySQL)に未登録のデータを新たに登録するタスク"
  task add_data: :environment do
    class Tweet < ApplicationRecord
      require 'twitter'

      @client = Twitter::REST::Client.new do |config|
        config.consumer_key        = TWITTER_CONSUMER_KEY
        config.consumer_secret     = TWITTER_CONSUMER_SECRET
        config.access_token        = TWITTER_ACCESS_TOKEN
        config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
      end


      last_tweet = Tweet.last #tweetsテーブルの最後のレコードを取得(つまり最新のtweetのレコード)
      last_tweet_id = last_tweet.tweet_id # tweet_idを取得

      # last_tweet_id = 1094541232783515648

      count_add_new_tweet = 0 #データベースに新規追加されるtweetの件数

      #engineerリストのtweetで、既にDB登録済みの最も新しいtweet以降で、RTとリプライは除いてた要素を取得。reverse_eachを使うことで逆順に(古い順)にデータベースに登録させる。
      #それにより、DBの最後のレコードのtweet.idは常に最新のtweet.id(last_tweet_id)になる。
      @client.list_timeline("engineer", count:1000, since_id:last_tweet_id).reverse_each do |tweet|  
        unless tweet.retweet? 
          unless tweet.reply?
            Tweet.create(tweet: tweet.full_text, user_name: tweet.user.screen_name, 
                         favorite_count: tweet.favorite_count, retweet_count: tweet.retweet_count, 
                         tweet_point: tweet.favorite_count + tweet.retweet_count,
                         tweet_url: tweet.url, tweet_id: tweet.id, tweet_time: tweet.created_at)
            
            count_add_new_tweet += 1
          end
        end
      end
      
      if count_add_new_tweet == 0
        puts "新しいtweetはありません"
      else 
        puts "新しいtweetが#{count_add_new_tweet}件データベースに追加されました"
      end
    end
  end
end
