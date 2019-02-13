class RemoveClassGenresSongId < ActiveRecord::Migration
  def change
    remove_column :genres, :song_id, :integer
  end
  
end
