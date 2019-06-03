class RemoveArtistFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :artist
  end
end
