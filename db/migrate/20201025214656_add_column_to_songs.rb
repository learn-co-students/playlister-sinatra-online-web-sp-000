class AddColumnToSongs < ActiveRecord::Migration[5.2]
  def change
    def up
      add_column :songs, :artist_id, :integer
    end
  
    def down
      remove_column :songs, :artist_id
    end
  end
end
