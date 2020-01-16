class CreateArtistGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :artists_genres, id: false do |t|
      t.belongs_to :artist
      t.belongs_to :genre
    end
  end
end
