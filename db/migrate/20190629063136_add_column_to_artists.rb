class AddColumnToArtists < ActiveRecord::Migration[5.2]
  #Class should have name of: AddColumnToSOngs
  def change
    add_column :songs, :artist_id, :integer
  end
end
