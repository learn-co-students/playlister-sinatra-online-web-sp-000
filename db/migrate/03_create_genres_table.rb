class CreateGenresTable < ActiveRecord::Migration[4.2]

    def change
        create_table :genres do |g|
            g.string :genre
            g.string :song
        end
    end
end