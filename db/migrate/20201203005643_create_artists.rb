class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |a|
      a.string :name
      a.integer :song_id
      a.integer :genre_id
      a.string :slug
    end
  end
end
