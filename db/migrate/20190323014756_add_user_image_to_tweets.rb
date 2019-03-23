class AddUserImageToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :user_image, :string
  end
end
