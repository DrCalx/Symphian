class CreateJoinTableGenreGroup < ActiveRecord::Migration
  def change
    create_join_table :genres, :groups do |t|
      # t.index [:genre_id, :group_id]
      # t.index [:group_id, :genre_id]
    end
  end
end
