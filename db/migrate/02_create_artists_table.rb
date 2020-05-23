class CreateArtistsTable < ActiveRecord::Migration[4.2]

    def change
        create_table :artist do |a|
            a.string :name
        end
    end
end