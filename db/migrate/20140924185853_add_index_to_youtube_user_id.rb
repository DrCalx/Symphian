class AddIndexToYoutubeUserId < ActiveRecord::Migration
  def change
  	add_index :youtubes, :user_id, unique: true
  end
end
