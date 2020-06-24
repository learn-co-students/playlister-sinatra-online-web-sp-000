class CreateSongGenres < ActiveRecord::Migration[4.2]

    def change
        create_table :song_genres do |g|
            g.integer :song_id
            g.integer :genre_id
        end
    end
end