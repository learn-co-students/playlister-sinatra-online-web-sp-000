class CreateSongsTable < ActiveRecord::Migration[4.2]

    def change
        create_table :songs do |s|
            s.string :name

        end
    end
end
