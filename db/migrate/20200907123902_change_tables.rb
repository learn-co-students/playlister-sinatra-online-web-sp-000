class ChangeTables < ActiveRecord::Migration[5.2]
 
  def change
  	change_table :genres do |t|
  		t.remove :song_id
  	end

  	change_table :songs do |t|
  		t.remove :genre_ids
  	end

  	create_table :song_genres do |t|
  		t.integer :song_id
  		t.integer :genre_id
  	end  	  	

  end
end
