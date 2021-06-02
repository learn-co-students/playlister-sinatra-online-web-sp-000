class RenameSongGenresTable < ActiveRecord::Migration[5.2]
  def change
    rename_table :song_genre, :song_genres
  end
end
