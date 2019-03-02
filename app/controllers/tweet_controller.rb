class TweetController < ApplicationController
  def index
    @tweets = Tweet.order(tweet_point: :desc).limit(10)
    # 今日から1週間前の日付を取得する
    # Tweetの中で、1週間
  end
end
