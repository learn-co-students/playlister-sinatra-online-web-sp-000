class DropSongsGenres < ActiveRecord::Migration
  def change
    drop_table :songs_genres
  end
end
