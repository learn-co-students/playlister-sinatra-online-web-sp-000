class RemoveSongGenreIdFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :song_genre_id, :integer
  end
end
