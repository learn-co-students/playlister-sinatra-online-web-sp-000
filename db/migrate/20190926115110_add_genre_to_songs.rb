class AddGenreToSongs < ActiveRecord::Migration[5.2]
  def change
     add_column :songs, :song_genre_id, :integer
     add_column :songs, :genre_id, :integer
  end
end
