class ChangeSongsgenresName < ActiveRecord::Migration[5.2]
  def change
    rename_table :songsgenres, :song_genres
  end
end
