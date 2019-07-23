class CreateSongGenres < ActiveRecord::Migration[5.2]
  def up
    create_table :songgenres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
 
  def down
    drop_table :songgenres
  end
end
