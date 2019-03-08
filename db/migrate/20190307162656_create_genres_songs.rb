class CreateGenresSongs < ActiveRecord::Migration
  def change
    create_table :genres_songs do |t|
      t.string :genre_id
      t.string :song_id
    end
  end
end
