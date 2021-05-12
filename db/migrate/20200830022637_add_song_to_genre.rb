class AddSongToGenre < ActiveRecord::Migration[5.2]
  def change
    add_column :genres, :song_id, :integer
  end
end
