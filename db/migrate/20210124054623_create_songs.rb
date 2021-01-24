class CreateSongs < ActiveRecord::Migration[5.2]
     def change
        create_table :songs do |t|
          t.string :name
          t.string :artist_id
          t.string :genre_ids 
        end
     end
end
