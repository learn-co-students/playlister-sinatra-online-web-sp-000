class Renamecolumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :artist_ids, :artist_id
  end
end
