class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.inttweet_time :id
      t.text :tweet
      t.int :favorite_count
      t.int :retweet_count
      t.varchar :user_name
      t.varchar :tweet_url
      t.datetime :created_at
      t.datetime :updated_at
      t.varchar :tweet_id
      t.int :tweet_point
    end
  end
end
