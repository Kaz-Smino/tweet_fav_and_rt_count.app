class TweetController < ApplicationController

  def index
    @tweets = Tweet.order(tweet_point: :desc).limit(100).page(params[:page])
    # 今日から1週間前の日付を取得する
    # Tweetの中で、
  end
end
