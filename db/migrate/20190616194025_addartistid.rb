class Addartistid < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :artist_ids, :integer
  end
end
