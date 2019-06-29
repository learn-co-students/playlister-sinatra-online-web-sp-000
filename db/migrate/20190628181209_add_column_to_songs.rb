class AddColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :song_id, :integer
  end
end
