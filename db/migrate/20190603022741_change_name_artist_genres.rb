class ChangeNameArtistGenres < ActiveRecord::Migration[5.2]
  def change
    rename_table :artist_genres, :artists_genres
  end
end
