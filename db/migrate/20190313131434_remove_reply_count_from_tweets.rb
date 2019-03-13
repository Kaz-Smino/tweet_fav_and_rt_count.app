class RemoveReplyCountFromTweets < ActiveRecord::Migration[5.2]
  def change
    remove_column :tweets, :reply_count, :int
  end
end
