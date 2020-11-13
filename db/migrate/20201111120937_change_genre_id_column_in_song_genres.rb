class ChangeGenreIdColumnInSongGenres < ActiveRecord::Migration[5.2]
  def change
    rename_column :song_genres, :genre_ids, :genre_id
  end
end
