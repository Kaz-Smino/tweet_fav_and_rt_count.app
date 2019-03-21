namespace :mysql do
  desc "データベース(MySQL)に未登録のデータを新たに登録するタスク"
  task add_data: :environment do

    require 'twitter'

    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = TWITTER_CONSUMER_KEY
      config.consumer_secret = TWITTER_CONSUMER_SECRET
      config.access_token = TWITTER_ACCESS_TOKEN
      config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    end

    last_tweet = Tweet.last

    if last_tweet.nil?
      last_tweet_id = 1
    else
      last_tweet_id = last_tweet.tweet_id
    end

    count_add_new_tweet = 0



    @client.list_timeline("engineer", count:1000, since_id:last_tweet_id).reverse_each do |tweet|  
      unless tweet.retweet? 
        unless tweet.reply?
          Tweet.create(tweet: @client.status(tweet.id, { tweet_mode: "extended" }).attrs[:full_text],
                        user_name: tweet.user.screen_name, 
                        favorite_count: tweet.favorite_count, retweet_count: tweet.retweet_count, 
                        tweet_point: tweet.favorite_count + tweet.retweet_count,
                        tweet_url: tweet.url, tweet_id: tweet.id, tweet_time: tweet.created_at,
                        user_image: tweet.user.profile_image_url, name: tweet.user.name,
                        url: tweet.user.url, followers_count: tweet.user.followers_count)
            
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

  desc "データベース(MySQL)のお気に入りとRTのデータを更新するタスク"
  task update_data: :environment do

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

    @count_update_tweet = 0

    latest_tweets.each do |lt|
      update_tweets = Tweet.find_by(tweet_id: lt.id)
      unless update_tweets.nil?
        tweet = Tweet.where(tweet_id: update_tweets.tweet_id)
        tweet.update(favorite_count: lt.favorite_count)
        tweet.update(retweet_count: lt.retweet_count)
        tweet.update(tweet_point: lt.favorite_count + lt.retweet_count)
        tweet.update(user_image: lt.user.profile_image_url)
        tweet.update(followers_count: lt.user.followers_count)
        @count_update_tweet += 1
      end
    end
    puts "#{@count_update_tweet}件のtweet(お気に入り&RT数)が更新されました"
  end
end