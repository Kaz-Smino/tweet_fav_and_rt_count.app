class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.datetime :tweet_time
      t.string :tweet
      t.integer :favorite_count
      t.integer :retweet_count
      t.string :user_name
      t.text :tweet_url
      t.datetime :created_at
      t.datetime :updated_at
      t.text	 :tweet_id
      t.integer :tweet_point
    end

  end
end
