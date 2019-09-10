class CreateTables < ActiveRecord::Migration[5.2]
  def change
    
    create_table :artists do |t|
      t.string :name
    end

    create_table :songs do |t|
      t.string :name
      t.belongs_to :artist
    end

    create_table :genres do |t|
      t.string :name
    end

    create_table :song_genres, id: false do |t|
      t.belongs_to :song
      t.belongs_to :genre
    end
  end
end
