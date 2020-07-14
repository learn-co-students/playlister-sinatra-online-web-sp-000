class CreateGenresTable < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |g|
      g.string :name
      g.integer :artist_id
    end
  end
end
