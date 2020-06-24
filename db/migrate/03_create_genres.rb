class CreateGenres < sActiveRecord::Migration[4.2]

    def change
        create_table :genres do |g|
            g.string :name
        end
    end
end