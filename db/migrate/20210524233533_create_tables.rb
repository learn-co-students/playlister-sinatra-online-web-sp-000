class CreateTables < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
    end

    create_table :genres do |t|
      t.string :name
    end

    create_table :songs do |t|
      t.string :name
      #add artist_id because it was designated that songs belong to one artist
      t.integer :artist_id
    end

    #join table joins song_id to genre_id
    create_table :song_genre do |t|
      t.integer :song_id
      t.integer :genre_id
    end
  end
end
