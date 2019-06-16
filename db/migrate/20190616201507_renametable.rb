class Renametable < ActiveRecord::Migration[5.2]
  def change
    rename_table :SongGenre, :song_genres
  end
end
