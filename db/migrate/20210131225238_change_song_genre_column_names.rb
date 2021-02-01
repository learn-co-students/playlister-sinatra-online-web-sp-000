class ChangeSongGenreColumnNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :song_genres, :song_ids, :song_ids
    rename_column :song_genres, :genre_ids, :genre_id
  end
end
