class AddFollowersCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :followers_count, :int
  end
end
