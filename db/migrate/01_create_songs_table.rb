class CreateSongsTable < ActiveRecord::Migration[4.2]

    def change
        create_table :songs do |s|
            s.string :name
            s.string :genre
        end
    end
end
