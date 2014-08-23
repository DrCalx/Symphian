class CreateJoinTableGenreUser < ActiveRecord::Migration
  def change
    create_join_table :genres, :users do |t|
      # t.index [:genre_id, :user_id]
      # t.index [:user_id, :genre_id]
    end
  end
end
