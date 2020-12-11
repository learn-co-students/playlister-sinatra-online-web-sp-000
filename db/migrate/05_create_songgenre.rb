class CreateSonggenre < ActiveRecord::Migration[5.2]
    #Apparently SOMETHING in rake? in AR? in wherever doesn't like CreateSongGenre
    #So it's Create Songgenre
    #Go figure
    def change
        create_table :songgenres do |x|
            x.integer :genre_id
            x.integer :song_id
        end 
    end 
end 