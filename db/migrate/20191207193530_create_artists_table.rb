class CreateArtistsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |a|
      a.string :name
      a.integer :genre_id
    end
  end
end
