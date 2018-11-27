class CreateSongsAndGenres < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.belongs_to :artist, index: true
    end

    create_table :genres do |t|
      t.string :name
    end

    create_table :genres_songs do |t|
      t.belongs_to :song, index: true
      t.belongs_to :genre, index: true
    end
  end
end
