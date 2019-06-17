class Deleteartist < ActiveRecord::Migration[5.2]
  def change
    remove_column :songs, :artis
  end
end
