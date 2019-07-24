class AddGenreIdColumnToSong < ActiveRecord::Migration[5.2]
  def up
     add_column :songs, :genre_id, :integer
  end

  def down
    remove_column :songs, :genre_id, :integer
  end
end
