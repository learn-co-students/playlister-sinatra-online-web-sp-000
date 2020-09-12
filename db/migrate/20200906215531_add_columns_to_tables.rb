class AddColumnsToTables < ActiveRecord::Migration[5.2]
 
  def change
  	change_table :genres do |t|
	  t.integer :song_id
  	end 
  end
end
