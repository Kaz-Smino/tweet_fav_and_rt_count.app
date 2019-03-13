class AddReplyCountToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :reply_count, :int
  end
end
