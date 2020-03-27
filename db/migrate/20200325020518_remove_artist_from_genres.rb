class RemoveArtistFromGenres < ActiveRecord::Migration[5.2]
  def change
    remove_column :genres, :artist, :string 
  end
end
