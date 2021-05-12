class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.string :name
      t.string :slug
      t.belongs_to :artist
      t.belongs_to :genre
    end
  end
end
