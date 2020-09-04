class CreateSongGenre < ActiveRecord::Migration[5.2]
  def up
    create_table :song_genres do |t|
      t.string :song_id
      t.string :genre_id
    end 
  end

  def down
    drop_table :song_genre
  end 

end
