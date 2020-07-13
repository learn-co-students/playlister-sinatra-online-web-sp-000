class DropTables2 < ActiveRecord::Migration[5.2]
  def change
    drop_table :songs
    drop_table :artists
    drop_table :genres
    drop_table :song_genres
  end
end
