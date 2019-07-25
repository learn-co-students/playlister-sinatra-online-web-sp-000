class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
<<<<<<< HEAD
      t.integer :song_id
      t.integer :genre_id
    end
=======
      t.integer :song_id 
      t.integer :genre_id 
    end 
>>>>>>> 9124cd55a1b9034daf5e4982762b9ec4ee70aca8
  end
end
