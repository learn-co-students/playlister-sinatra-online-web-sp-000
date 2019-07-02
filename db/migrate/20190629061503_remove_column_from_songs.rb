class RemoveColumnFromSongs < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :song_id
  end
end
