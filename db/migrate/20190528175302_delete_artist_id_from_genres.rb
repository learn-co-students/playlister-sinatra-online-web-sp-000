class DeleteArtistIdFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :artist_id
  end
end
