class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :name
      # t.integer :song_id
      # t.integer :genre_id
    end
  end

  # def down
  #   drop_table :artists
  # end
end
