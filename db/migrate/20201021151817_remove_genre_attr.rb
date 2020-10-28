class RemoveGenreAttr < ActiveRecord::Migration[5.2]
  def change

    change_table :genres do |t|
      t.remove :artist_id
      t.remove :song_id
  end
end
end
