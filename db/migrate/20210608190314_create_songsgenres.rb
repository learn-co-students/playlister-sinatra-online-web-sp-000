class CreateSongsgenres < ActiveRecord::Migration[5.2]
  def change
    create_table :songsgenres do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
