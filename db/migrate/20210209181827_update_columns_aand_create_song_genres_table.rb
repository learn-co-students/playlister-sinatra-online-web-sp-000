class UpdateColumnsAandCreateSongGenresTable < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :artist_id
    remove_column :songs, :genre_ids
    create_table :song_genres do |t|
      t.integer :song_id
      t.integer :genre_id
    end 
  end
end
