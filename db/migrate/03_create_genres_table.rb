class CreateGenresTable < ActiveRecord::Migration[4.2]

    def change
        create_table :genres do |g|
            g.string :artist
            g.string :song
        end
    end
end