class ChangeSongIdColumnInSongGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :song_genres, :song_ids, :song_id
  end
end
