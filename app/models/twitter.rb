#!/usr/bin/ruby
# encoding: utf-8

# twitterライブラリの呼び出し
require 'twitter'

# アクセストークンなどを設定
@client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

# client tutorial
def tutorial
  puts "Welcome to Sumino0829 Client."
  puts "起動する際は、末尾に以下のオプションをつけてください"
  puts "-t HomeのTimeline取得"
  puts "-m リプライの取得"
  puts "-l リストの取得"
  puts "tweetの内容！"
end

# display timeline
def homeTimeline
  @client.home_timeline.each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
    puts "お気に入りの数：#{tweet.favorite_count}"
    puts "Retweetの数：#{tweet.retweet_count}"
    puts "TweetのURL：#{tweet.url}"
  end
end

# display mentions
def mentionTimeline
  @client.mentions_timeline.each do |tweet|
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text

  end
end

# display list :tanigwsatoはユーザーID engineer3はリスト名(どちらもURLからコピペした)
def listTimeline
<<<<<<< HEAD
  @client.list_timeline("engineer", count:50).each do |tweet| 
=======
  @client.list_timeline("tanigwsato", "engineer3").each do |tweet|
>>>>>>> origin/master
    puts "\e[33m" + tweet.user.name + "\e[32m" + "[ID:" + tweet.user.screen_name + "]"
    puts "\e[0m" + tweet.text
    puts "↓"
    puts "tweetされた日付・時刻：#{tweet.created_at}"
    puts "お気に入りの数：#{tweet.favorite_count}"
    puts "Retweetの数：#{tweet.retweet_count}"
    puts "TweetのURL：#{tweet.url}"
  end
end

# tweet
def tweet
  @client.update(ARGV[0])
  puts "Tweetしました"
end

option = ARGV[0].to_s

if option == "" then
  tutorial
elsif option == "-t" then
  homeTimeline
elsif option == "-m" then
  mentionTimeline
elsif option == "-l" then
  listTimeline
else
  tweet
  homeTimeline
<<<<<<< HEAD
<<<<<<< HEAD
end
=======
end
>>>>>>> 5fb69bf58c582229fcff6363ac3c31ea7bf9882c
=======
end
>>>>>>> origin/master
