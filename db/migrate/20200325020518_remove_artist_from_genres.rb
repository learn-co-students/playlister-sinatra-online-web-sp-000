class RemoveArtistFromGenres < ActiveRecord::Migration[4.2]
  def change
    remove_column :genres, :artist, :string 
  end
end
