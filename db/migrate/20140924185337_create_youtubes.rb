class CreateYoutubes < ActiveRecord::Migration
  def change
    create_table :youtubes do |t|
      t.string :playlist
      t.integer :user_id

      t.timestamps
    end
  end
end
