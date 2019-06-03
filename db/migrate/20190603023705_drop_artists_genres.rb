class DropArtistsGenres < ActiveRecord::Migration[5.2]
  def change
    drop_table :artists_genres
  end
end
