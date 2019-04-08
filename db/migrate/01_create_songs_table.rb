class CreateSongsTable < ActiveRecord::Migration[4.2]
  def change
    create_table :songs do |t|
      t.integer :artist_id
      t.string :name
    end
  end
end
