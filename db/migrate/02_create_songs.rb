class CreateSongs < ActiveRecord::Migration[5.2]
  create_table :songs do |t|
    t.string :name
    t.references :artist, index: true, foreign_key: true

    t.timestamps
  end
end
