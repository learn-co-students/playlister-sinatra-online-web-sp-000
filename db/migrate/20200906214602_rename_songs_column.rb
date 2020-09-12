class RenameSongsColumn < ActiveRecord::Migration[5.2]
 
  def change
  	change_table :songs do |t|
	  t.rename :genre_id, :genre_ids
  	end 
  end
end
