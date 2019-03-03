class TweetController < ApplicationController
  PER = 10

  def index
    @tweets = Tweet.page(params[:page]).per(PER)
    @tweets = Tweet.order(tweet_point: :desc).limit(100)
    # 今日から1週間前の日付を取得する
    # Tweetの中で、
  end
end
