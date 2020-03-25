class CreateSongsGenresJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :songs, :genres do |t|
      t.index :song_id 
      t.index :genre_id 
    end 
  end
end
