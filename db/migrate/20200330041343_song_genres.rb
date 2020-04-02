class SongGenres < ActiveRecord::Migration[5.2]
  def up
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_ids
    end
  end

  def down
    drop_table :song_genres
  end
end
