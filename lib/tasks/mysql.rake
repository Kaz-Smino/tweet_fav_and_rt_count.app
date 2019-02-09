namespace :mysql do
  desc "データベース(MySQL)にデータを登録するタスク"
  task add_data: :environment do
    class Tweet < ApplicationRecord
      Tweet.create(tweet: "tweet_20190204_3", user_name: "user_20190204_3", favorite_count: "99", retweet_count: "50", tweet_url: "https://twitter.com/XXX/status/XXXXXXXXXXXXXXXX")
    end  
  end
end
