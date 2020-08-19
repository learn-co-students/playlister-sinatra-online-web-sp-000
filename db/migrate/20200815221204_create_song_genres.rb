class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
       t.string :genre_id
       t.string :song_id
       t.string :artist_id
    end
    
  end
end
