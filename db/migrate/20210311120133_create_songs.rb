class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |c|
      c.string :name
      c.integer :artist_id
    end
  end
end
