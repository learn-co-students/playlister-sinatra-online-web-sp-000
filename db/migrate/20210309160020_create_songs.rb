class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |col|
      col.string :name
      col.integer :artist_id
    end
  end
end
