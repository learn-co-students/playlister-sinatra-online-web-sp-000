class CreateSongGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :song_genres do |t|
      t.string :song_id
      t.string :genre_id
    end
  end
end
