class SongGenres < ActiveRecord::Migration[5.2]
  def up
    create_table :song_genres
  end

  def down
    drop_table :song_genres
  end
end
